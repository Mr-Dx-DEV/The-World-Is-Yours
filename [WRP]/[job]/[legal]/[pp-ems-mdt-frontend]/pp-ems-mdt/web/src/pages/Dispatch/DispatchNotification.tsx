import React, { useEffect, useState, forwardRef, useContext } from 'react'
import { ThemeContext } from '../../providers/ThemeProvider'
import { Avatar, Button, Tooltip } from 'antd'
import { LuTimer } from 'react-icons/lu'
import { formatTimeUntil } from '../../utils'
import { IoLocationOutline } from 'react-icons/io5'
import { MdKeyboardDoubleArrowRight } from 'react-icons/md'
import { AiOutlineUser } from 'react-icons/ai'
import { GrUserPolice } from 'react-icons/gr'
import { DispatchNotifications } from '../../types'
import { GiPistolGun } from 'react-icons/gi'
import { useConfig } from '../../hooks/useConfig'
import { t } from '../../hooks/useLocale'
import { fetchNui } from '../../utils/fetchNui'
import { showNotification } from '../../utils/misc'

interface DispatchNotificationProps {
    notification: DispatchNotifications
    onClick: () => void
    selected?: boolean
    provider?: boolean
    isExiting?: boolean
    onExitComplete?: () => void
    onCancelSelect?: () => void
    onTop?: boolean
    quickRespond?: boolean
    quickRespondKeybind?: string
    setNotifications?: React.Dispatch<React.SetStateAction<DispatchNotifications[]>>
}

const availableColors = ['blue', 'pink', 'orange', 'green', 'cyan', 'purple', 'black', 'red']

const getRandomColor = () => {
    return availableColors[Math.floor(Math.random() * availableColors.length)]
}

const DispatchNotification = forwardRef<HTMLDivElement, DispatchNotificationProps>(
    (
        {
            notification,
            onClick,
            selected,
            provider = false,
            onCancelSelect,
            onTop,
            quickRespond,
            quickRespondKeybind,
            setNotifications,
        },
        ref,
    ) => {
        const { theme } = useContext(ThemeContext)
        const [notif, setNotif] = useState(notification)
        const [color, setColor] = useState<string>(
            availableColors.includes(notification.code.color)
                ? notification.code.color
                : getRandomColor(),
        )
        const [animationClass, setAnimationClass] = useState<string>(
            provider ? 'notification-enter' : '',
        )
        const [distance, setDistance] = useState<string | null>(null)
        const config = useConfig()

        useEffect(() => {
            if (provider) {
                const enterTimeout = setTimeout(() => {
                    setAnimationClass('')
                }, 500)

                return () => {
                    clearTimeout(enterTimeout)
                }
            }
        }, [provider, notif.id])

        useEffect(() => {
            const interval = setInterval(() => {
                setNotif((prevNotif) => ({
                    ...prevNotif,
                    timestamp: prevNotif.timestamp,
                }))
            }, 1000)

            return () => clearInterval(interval)
        }, [])

        if (notif.coords) {
            fetchNui('getDistance', { coords: notif.coords }).then((response: any) => {
                setDistance(response)
            })
        }

        useEffect(() => {
            if (notif.coords) {
                const interval = setInterval(async () => {
                    fetchNui('getDistance', { coords: notif.coords }).then((response: any) => {
                        setDistance(response)
                    })
                }, 1000)

                return () => clearInterval(interval)
            }
        }, [notif.coords])

        useEffect(() => {
            setNotif(notification)
        }, [notification])

        const handleStopRespond = (notification?: boolean) => {
            fetchNui('dispatchStopRespond', { id: notif.id })
                .then((response: any) => {
                    if (response.success && response.respond) {
                        if (notification !== false) {
                            showNotification(
                                response.message || t('dispatch.notification.stoprespond.success'),
                                'success',
                            )
                        }

                        setNotif((prevNotif) => ({
                            ...prevNotif,
                            responds: response.respond,
                            meResponding: false,
                        }))
                    } else {
                        showNotification(
                            response.message || t('dispatch.notification.stoprespond.failure'),
                            'error',
                        )
                    }
                })
                .catch((error) => {
                    console.error('Respond error:', error)
                    showNotification(t('dispatch.notification.respond.failure'), 'error')
                })
        }

        const handleRespond = (notification?: boolean) => {
            fetchNui('dispatchRespond', { id: notif.id })
                .then((response: any) => {
                    if (response.success && response.respond) {
                        if (notification !== false) {
                            showNotification(
                                response.message || t('dispatch.notification.success'),
                                'success',
                            )
                        }

                        if (
                            response.removedResponses &&
                            response.removedResponses.length > 0 &&
                            typeof setNotifications === 'function'
                        ) {
                            setNotifications((prevNotifications: DispatchNotifications[]) =>
                                prevNotifications.map((notif: DispatchNotifications) =>
                                    response.removedResponses.some(
                                        (removed: any) => removed.id === notif.id,
                                    )
                                        ? {
                                              ...notif,
                                              responds:
                                                  response.removedResponses.find(
                                                      (removed: any) => removed.id === notif.id,
                                                  )?.responds || [],
                                              meResponding: false,
                                          }
                                        : notif,
                                ),
                            )
                        }

                        setNotif((prevNotif) => ({
                            ...prevNotif,
                            responds: [...(prevNotif.responds || []), ...response.respond],
                            meResponding: true,
                        }))
                    } else {
                        showNotification(response.message || 'Failed to respond.', 'error')
                    }
                })
                .catch((error) => {
                    console.error('Respond error:', error)
                    showNotification('Failed to respond. Please try again later.', 'error')
                })
        }

        const handleCancel = () => {
            onCancelSelect && onCancelSelect()
        }

        useEffect(() => {
            if (quickRespond === true) {
                if (notif.meResponding !== true) {
                    handleRespond(false)
                }
            } else if (quickRespond === false) {
                if (notif.meResponding) {
                    handleStopRespond(false)
                }
            }
        }, [quickRespond, notif.meResponding])
        return (
            <div
                ref={ref}
                style={{
                    border: `1px solid ${theme.components.Card.colorBorderSecondary}`,
                    userSelect: 'none',
                    cursor: 'pointer',
                }}
                className={`dispatch-notification-card ${selected ? 'selected' : ''} ${
                    notif.flash ? 'flash' : ''
                } ${quickRespond !== true && notif.meResponding ? 'responding' : ''}`}
                onClick={onClick}
            >
                <div className="notification-title">
                    <span className={`notification-tag blue`}>#{notif.id}</span>
                    {notif.code?.code && (
                        <span
                            className={`notification-tag ${
                                notif.weapon && config.dispatch.weaponColors
                                    ? config.dispatch.weaponColors[notif.weapon]
                                    : color
                            }`}
                        >
                            {notif.code.code}
                        </span>
                    )}
                    <h4>{notif.title}</h4>
                </div>

                <div className="notification-content">
                    <p>{notif.description}</p>
                    <Tooltip title={`${new Date(notif.timestamp * 1000).toLocaleString()}`}>
                        <div className="notification-content-line">
                            <LuTimer />
                            <p className="notification-content-label">
                                {t('dispatch.notification.report_time')}:{' '}
                            </p>
                            <p
                                className="notification-content-data"
                                style={{ width: 'fit-content' }}
                            >
                                {formatTimeUntil(new Date(notif.timestamp * 1000))}
                            </p>
                        </div>
                    </Tooltip>
                    {notif.coords && (
                        <div className="notification-content-line">
                            <IoLocationOutline />
                            <p className="notification-content-label">
                                {t('dispatch.notification.location')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.street} - </p>
                            {distance && (
                                <p
                                    style={{ color: 'var(---token-colorTextPrimary)' }}
                                    className="notification-content-data"
                                >
                                    {distance}
                                </p>
                            )}
                            <MdKeyboardDoubleArrowRight className="clickable-icon" />
                        </div>
                    )}
                    {notif.weapon && (
                        <div className="notification-content-line">
                            <GiPistolGun />
                            <p className="notification-content-label">
                                {t('dispatch.notification.weapon')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.weapon}</p>
                        </div>
                    )}
                    {notif.citizen?.value && (
                        <div className="notification-content-line">
                            <AiOutlineUser />
                            <p className="notification-content-label">
                                {t('dispatch.notification.citizen')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.citizen.label}</p>
                        </div>
                    )}
                    {notif.citizen?.gender && (
                        <div className="notification-content-line">
                            <AiOutlineUser />
                            <p className="notification-content-label">
                                {t('dispatch.notification.gender')}:{' '}
                            </p>
                            <p className="notification-content-data">{notif.citizen.gender}</p>
                        </div>
                    )}
                    {notif.responds && notif.responds.length > 0 && (
                        <div className="notification-content-line">
                            <GrUserPolice />
                            <p className="notification-content-label">
                                {t('dispatch.notification.responds')}:{' '}
                            </p>
                            <div
                                style={{ display: 'flex', marginLeft: '5px', alignItems: 'center' }}
                            >
                                <Avatar.Group>
                                    {notif.responds.map((officer, idx) => (
                                        <Tooltip title={officer.label} key={idx}>
                                            <Avatar
                                                style={{
                                                    backgroundColor: theme.token.colorPrimary,
                                                }}
                                            >
                                                {officer.label?.charAt(0)}
                                            </Avatar>
                                        </Tooltip>
                                    ))}
                                </Avatar.Group>
                            </div>
                        </div>
                    )}

                    {selected && (
                        <>
                            {!notif.meResponding ? (
                                <div className="buttons">
                                    <Button onClick={() => handleRespond()} type="primary">
                                        {t('dispatch.notification.respond.label')}
                                    </Button>
                                    <Button onClick={handleCancel} type="default">
                                        {t('global.cancel')}
                                    </Button>
                                </div>
                            ) : (
                                <div className="buttons">
                                    <Button onClick={() => handleStopRespond()} type="primary">
                                        {t('dispatch.notification.stoprespond.button')}
                                    </Button>
                                    <Button onClick={handleCancel} type="default">
                                        {t('global.cancel')}
                                    </Button>
                                </div>
                            )}
                        </>
                    )}
                </div>
                {onTop && quickRespond ? (
                    <p className="keybind_info">
                        {t('dispatch.notification.quickRespond.stop_respond')
                            .split('{key}')
                            .map((part, index, array) => (
                                <React.Fragment key={index}>
                                    {part}
                                    {index < array.length - 1 && (
                                        <span className="key">{quickRespondKeybind}</span>
                                    )}
                                </React.Fragment>
                            ))}
                    </p>
                ) : onTop && !quickRespond ? (
                    <p className="keybind_info">
                        {t('dispatch.notification.quickRespond.respond')
                            .split('{key}')
                            .map((part, index, array) => (
                                <React.Fragment key={index}>
                                    {part}
                                    {index < array.length - 1 && (
                                        <span className="key">{quickRespondKeybind}</span>
                                    )}
                                </React.Fragment>
                            ))}
                    </p>
                ) : null}
            </div>
        )
    },
)

export default DispatchNotification
