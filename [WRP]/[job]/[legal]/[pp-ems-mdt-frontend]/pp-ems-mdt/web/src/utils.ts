import {
    format
} from 'date-fns'
import dayjs from 'dayjs'

const getLabel = (value: number, ranges: { min: number; max: number; label: string }[]) => {
    for (let range of ranges) {
        if (value >= range.min && value <= range.max) {
            return range.label.replace('x', value.toString())
        }
    }
    return ''
}

export const formatTimeUntil = (date: Date) => {
    return dayjs(date).fromNow()
}

export const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return format(date, 'yyyy-MM-dd HH:mm:ss')
}
