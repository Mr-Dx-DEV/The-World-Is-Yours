import React, { createContext, useContext, useEffect, useState } from 'react'
import { DispatchNotifications } from '../types'
import DispatchNotification from '../pages/Dispatch/DispatchNotification'
import { AnimatePresence, motion } from 'framer-motion'
import { useNuiEvent } from '../hooks/useNuiEvent'

interface DispatchContextProps {
    addDispatchNotification: (notification: DispatchNotifications) => void
    playSound: (sound: string) => void
    setVolume: (volume: number) => void
    volume: number
}

const DispatchContext = createContext<DispatchContextProps | undefined>(undefined)

const saveVolumeToLocalStorage = (volume: number) => {
    localStorage.setItem('dispatchVolume', volume.toString())
}

const getVolumeFromLocalStorage = (): number => {
    const volume = localStorage.getItem('dispatchVolume')
    return volume ? parseFloat(volume) : 1
}

export const DispatchProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const [dispatchNotifications, setDispatchNotifications] = useState<DispatchNotifications[]>([])
    const [volume, setVolumeState] = useState<number>(getVolumeFromLocalStorage())
    const [quickRespondNotificationId, setQuickRespondNotificationId] = useState<number | null>(
        null,
    )
    const [quickRespondKeybind, setQuickRespondKeybind] = useState<string>(
        localStorage.getItem('quickRespondKeybind') || 'G',
    )
    const setVolume = (volume: number) => {
        setVolumeState(volume)
        saveVolumeToLocalStorage(volume)
    }

    const addDispatchNotification = (notification: DispatchNotifications) => {
        setDispatchNotifications((prev) => [...prev, notification])

        setTimeout(() => {
            removeDispatchNotification(notification.id)
        }, 8000)
    }

    const removeDispatchNotification = (id: number) => {
        setDispatchNotifications((prev) => prev.filter((n) => n.id !== id))
        if (quickRespondNotificationId === id) {
            setQuickRespondNotificationId(null)
        }
    }

    const playSound = (sound: string) => {
        const audio = new Audio(`./public/sounds/${sound}.mp3`)
        audio.volume = volume
        audio.play().catch((error) => {
            console.error('Failed to play sound:', error)
        })
    }

    useNuiEvent('dispatch:quickRespond', (key: string) => {
        if (dispatchNotifications.length > 0) {
            const topNotificationId = dispatchNotifications[0].id
            if (quickRespondNotificationId === topNotificationId) {
                setQuickRespondNotificationId(null)
            } else {
                setQuickRespondNotificationId(topNotificationId)
            }
            setQuickRespondKeybind(key)
            localStorage.setItem('quickRespondKeybind', key)
        }
    })

    useEffect(() => {
        const handleEvent = (event: any) => {
            if (event.data.action === 'dispatchNotification') {
                const { sound, ...notificationData } = event.data.data
                addDispatchNotification(notificationData)

                playSound(sound || 'default')
            }
        }

        window.addEventListener('message', handleEvent)

        return () => {
            window.removeEventListener('message', handleEvent)
        }
    }, [volume])

    return (
        <DispatchContext.Provider value={{ addDispatchNotification, playSound, setVolume, volume }}>
            {children}
            <div
                style={{
                    position: 'fixed',
                    top: 0,
                    right: 10,
                    margin: '5px',
                    zIndex: 1000,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'flex-end',
                    gap: '5px',
                }}
            >
                <AnimatePresence>
                    {dispatchNotifications
                        .sort((a, b) => b.id - a.id)
                        .map((notification, index) => (
                            <motion.div
                                key={notification.id}
                                initial={{ opacity: 0, x: 150 }}
                                animate={{ opacity: 1, x: -20 }}
                                exit={{ opacity: 0, y: -50 }}
                                transition={{ type: 'spring', stiffness: 50 }}
                            >
                                <DispatchNotification
                                    notification={notification}
                                    onClick={() => {}}
                                    selected={false}
                                    provider
                                    onTop={index === 0}
                                    quickRespond={notification.id === quickRespondNotificationId}
                                    quickRespondKeybind={quickRespondKeybind}
                                    onExitComplete={() =>
                                        removeDispatchNotification(notification.id)
                                    }
                                />
                            </motion.div>
                        ))}
                </AnimatePresence>
            </div>
        </DispatchContext.Provider>
    )
}

export const useDispatch = () => {
    const context = useContext(DispatchContext)
    if (context === undefined) {
        throw new Error('useDispatch must be used within a DispatchProvider')
    }
    return context
}

export const getVolume = () => {
    return getVolumeFromLocalStorage()
}
