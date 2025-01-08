import { ConfigProvider as AntdConfigProvider } from 'antd'
import dayjs from 'dayjs'
import relativeTime from 'dayjs/plugin/relativeTime'
import React, { useEffect, useState } from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter as Router } from 'react-router-dom'
import App from './components/App'
import { ConfigProvider, useConfig } from './hooks/useConfig'
import './index.css'
import { DispatchProvider } from './providers/DispatchProvider'
import { NotificationProvider } from './providers/NotificationProvider'
import { ThemeContext, ThemeProvider } from './providers/ThemeProvider'
dayjs.extend(relativeTime)

const localeMap: { [key: string]: { dayjs: () => Promise<any>; antd?: () => Promise<any> } } = {
    af: { dayjs: () => import('dayjs/locale/af') },
    am: { dayjs: () => import('dayjs/locale/am') },
    'ar-dz': { dayjs: () => import('dayjs/locale/ar-dz') },
    'ar-iq': { dayjs: () => import('dayjs/locale/ar-iq') },
    'ar-kw': { dayjs: () => import('dayjs/locale/ar-kw') },
    'ar-ly': { dayjs: () => import('dayjs/locale/ar-ly') },
    'ar-ma': { dayjs: () => import('dayjs/locale/ar-ma') },
    'ar-sa': { dayjs: () => import('dayjs/locale/ar-sa') },
    'ar-tn': { dayjs: () => import('dayjs/locale/ar-tn') },
    ar: { dayjs: () => import('dayjs/locale/ar'), antd: () => import('antd/locale/ar_EG') },
    az: { dayjs: () => import('dayjs/locale/az'), antd: () => import('antd/locale/az_AZ') },
    be: { dayjs: () => import('dayjs/locale/be'), antd: () => import('antd/locale/by_BY') },
    bg: { dayjs: () => import('dayjs/locale/bg'), antd: () => import('antd/locale/bg_BG') },
    bi: { dayjs: () => import('dayjs/locale/bi') },
    bm: { dayjs: () => import('dayjs/locale/bm') },
    'bn-bd': { dayjs: () => import('dayjs/locale/bn-bd') },
    bn: { dayjs: () => import('dayjs/locale/bn'), antd: () => import('antd/locale/bn_BD') },
    bo: { dayjs: () => import('dayjs/locale/bo') },
    br: { dayjs: () => import('dayjs/locale/br') },
    bs: { dayjs: () => import('dayjs/locale/bs') },
    ca: { dayjs: () => import('dayjs/locale/ca'), antd: () => import('antd/locale/ca_ES') },
    cs: { dayjs: () => import('dayjs/locale/cs'), antd: () => import('antd/locale/cs_CZ') },
    cv: { dayjs: () => import('dayjs/locale/cv') },
    cy: { dayjs: () => import('dayjs/locale/cy') },
    'de-at': { dayjs: () => import('dayjs/locale/de-at') },
    da: { dayjs: () => import('dayjs/locale/da'), antd: () => import('antd/locale/da_DK') },
    'de-ch': { dayjs: () => import('dayjs/locale/de-ch') },
    de: { dayjs: () => import('dayjs/locale/de'), antd: () => import('antd/locale/de_DE') },
    dv: { dayjs: () => import('dayjs/locale/dv') },
    el: { dayjs: () => import('dayjs/locale/el'), antd: () => import('antd/locale/el_GR') },
    'en-au': { dayjs: () => import('dayjs/locale/en-au') },
    'en-ca': { dayjs: () => import('dayjs/locale/en-ca') },
    'en-gb': { dayjs: () => import('dayjs/locale/en-gb'), antd: () => import('antd/locale/en_GB') },
    'en-ie': { dayjs: () => import('dayjs/locale/en-ie') },
    'en-il': { dayjs: () => import('dayjs/locale/en-il') },
    'en-in': { dayjs: () => import('dayjs/locale/en-in') },
    'en-nz': { dayjs: () => import('dayjs/locale/en-nz') },
    'en-sg': { dayjs: () => import('dayjs/locale/en-sg') },
    'en-tt': { dayjs: () => import('dayjs/locale/en-tt') },
    eo: { dayjs: () => import('dayjs/locale/eo') },
    en: { dayjs: () => import('dayjs/locale/en'), antd: () => import('antd/locale/en_US') },
    'es-do': { dayjs: () => import('dayjs/locale/es-do') },
    'es-mx': { dayjs: () => import('dayjs/locale/es-mx') },
    'es-pr': { dayjs: () => import('dayjs/locale/es-pr') },
    'es-us': { dayjs: () => import('dayjs/locale/es-us') },
    et: { dayjs: () => import('dayjs/locale/et'), antd: () => import('antd/locale/et_EE') },
    es: { dayjs: () => import('dayjs/locale/es'), antd: () => import('antd/locale/es_ES') },
    eu: { dayjs: () => import('dayjs/locale/eu'), antd: () => import('antd/locale/eu_ES') },
    fa: { dayjs: () => import('dayjs/locale/fa'), antd: () => import('antd/locale/fa_IR') },
    fo: { dayjs: () => import('dayjs/locale/fo') },
    fi: { dayjs: () => import('dayjs/locale/fi'), antd: () => import('antd/locale/fi_FI') },
    'fr-ca': { dayjs: () => import('dayjs/locale/fr-ca') },
    'fr-ch': { dayjs: () => import('dayjs/locale/fr-ch') },
    fr: { dayjs: () => import('dayjs/locale/fr'), antd: () => import('antd/locale/fr_FR') },
    fy: { dayjs: () => import('dayjs/locale/fy') },
    ga: { dayjs: () => import('dayjs/locale/ga'), antd: () => import('antd/locale/ga_IE') },
    gd: { dayjs: () => import('dayjs/locale/gd') },
    'gom-latn': { dayjs: () => import('dayjs/locale/gom-latn') },
    gl: { dayjs: () => import('dayjs/locale/gl'), antd: () => import('antd/locale/gl_ES') },
    gu: { dayjs: () => import('dayjs/locale/gu') },
    he: { dayjs: () => import('dayjs/locale/he'), antd: () => import('antd/locale/he_IL') },
    hi: { dayjs: () => import('dayjs/locale/hi'), antd: () => import('antd/locale/hi_IN') },
    hr: { dayjs: () => import('dayjs/locale/hr'), antd: () => import('antd/locale/hr_HR') },
    hu: { dayjs: () => import('dayjs/locale/hu'), antd: () => import('antd/locale/hu_HU') },
    ht: { dayjs: () => import('dayjs/locale/ht') },
    'hy-am': { dayjs: () => import('dayjs/locale/hy-am'), antd: () => import('antd/locale/hy_AM') },
    id: { dayjs: () => import('dayjs/locale/id'), antd: () => import('antd/locale/id_ID') },
    is: { dayjs: () => import('dayjs/locale/is') },
    'it-ch': { dayjs: () => import('dayjs/locale/it-ch') },
    it: { dayjs: () => import('dayjs/locale/it'), antd: () => import('antd/locale/it_IT') },
    ja: { dayjs: () => import('dayjs/locale/ja'), antd: () => import('antd/locale/ja_JP') },
    jv: { dayjs: () => import('dayjs/locale/jv') },
    ka: { dayjs: () => import('dayjs/locale/ka'), antd: () => import('antd/locale/ka_GE') },
    kk: { dayjs: () => import('dayjs/locale/kk') },
    km: { dayjs: () => import('dayjs/locale/km'), antd: () => import('antd/locale/km_KH') },
    kn: { dayjs: () => import('dayjs/locale/kn') },
    ko: { dayjs: () => import('dayjs/locale/ko'), antd: () => import('antd/locale/ko_KR') },
    ku: { dayjs: () => import('dayjs/locale/ku') },
    ky: { dayjs: () => import('dayjs/locale/ky') },
    lb: { dayjs: () => import('dayjs/locale/lb') },
    lo: { dayjs: () => import('dayjs/locale/lo') },
    lt: { dayjs: () => import('dayjs/locale/lt'), antd: () => import('antd/locale/lt_LT') },
    lv: { dayjs: () => import('dayjs/locale/lv'), antd: () => import('antd/locale/lv_LV') },
    me: { dayjs: () => import('dayjs/locale/me') },
    mi: { dayjs: () => import('dayjs/locale/mi') },
    mk: { dayjs: () => import('dayjs/locale/mk'), antd: () => import('antd/locale/mk_MK') },
    ml: { dayjs: () => import('dayjs/locale/ml'), antd: () => import('antd/locale/ml_IN') },
    mn: { dayjs: () => import('dayjs/locale/mn'), antd: () => import('antd/locale/mn_MN') },
    mr: { dayjs: () => import('dayjs/locale/mr') },
    'ms-my': { dayjs: () => import('dayjs/locale/ms-my') },
    ms: { dayjs: () => import('dayjs/locale/ms'), antd: () => import('antd/locale/ms_MY') },
    mt: { dayjs: () => import('dayjs/locale/mt') },
    my: { dayjs: () => import('dayjs/locale/my'), antd: () => import('antd/locale/my_MM') },
    nb: { dayjs: () => import('dayjs/locale/nb'), antd: () => import('antd/locale/nb_NO') },
    ne: { dayjs: () => import('dayjs/locale/ne'), antd: () => import('antd/locale/ne_NP') },
    'nl-be': { dayjs: () => import('dayjs/locale/nl-be') },
    nl: { dayjs: () => import('dayjs/locale/nl'), antd: () => import('antd/locale/nl_NL') },
    pl: { dayjs: () => import('dayjs/locale/pl'), antd: () => import('antd/locale/pl_PL') },
    'pt-br': { dayjs: () => import('dayjs/locale/pt-br') },
    pt: { dayjs: () => import('dayjs/locale/pt'), antd: () => import('antd/locale/pt_PT') },
    rn: { dayjs: () => import('dayjs/locale/rn') },
    ro: { dayjs: () => import('dayjs/locale/ro'), antd: () => import('antd/locale/ro_RO') },
    ru: { dayjs: () => import('dayjs/locale/ru'), antd: () => import('antd/locale/ru_RU') },
    rw: { dayjs: () => import('dayjs/locale/rw') },
    sd: { dayjs: () => import('dayjs/locale/sd') },
    se: { dayjs: () => import('dayjs/locale/se') },
    si: { dayjs: () => import('dayjs/locale/si'), antd: () => import('antd/locale/si_LK') },
    sk: { dayjs: () => import('dayjs/locale/sk'), antd: () => import('antd/locale/sk_SK') },
    sl: { dayjs: () => import('dayjs/locale/sl'), antd: () => import('antd/locale/sl_SI') },
    sq: { dayjs: () => import('dayjs/locale/sq') },
    'sr-cyrl': { dayjs: () => import('dayjs/locale/sr-cyrl') },
    ss: { dayjs: () => import('dayjs/locale/ss') },
    'sv-fi': { dayjs: () => import('dayjs/locale/sv-fi') },
    sr: { dayjs: () => import('dayjs/locale/sr'), antd: () => import('antd/locale/sr_RS') },
    sv: { dayjs: () => import('dayjs/locale/sv'), antd: () => import('antd/locale/sv_SE') },
    sw: { dayjs: () => import('dayjs/locale/sw') },
    ta: { dayjs: () => import('dayjs/locale/ta'), antd: () => import('antd/locale/ta_IN') },
    te: { dayjs: () => import('dayjs/locale/te') },
    tet: { dayjs: () => import('dayjs/locale/tet') },
    tg: { dayjs: () => import('dayjs/locale/tg') },
    th: { dayjs: () => import('dayjs/locale/th'), antd: () => import('antd/locale/th_TH') },
    tk: { dayjs: () => import('dayjs/locale/tk') },
    'tl-ph': { dayjs: () => import('dayjs/locale/tl-ph') },
    tlh: { dayjs: () => import('dayjs/locale/tlh') },
    tr: { dayjs: () => import('dayjs/locale/tr'), antd: () => import('antd/locale/tr_TR') },
    tzl: { dayjs: () => import('dayjs/locale/tzl') },
    'tzm-latn': { dayjs: () => import('dayjs/locale/tzm-latn') },
    tzm: { dayjs: () => import('dayjs/locale/tzm') },
    'ug-cn': { dayjs: () => import('dayjs/locale/ug-cn') },
    uk: { dayjs: () => import('dayjs/locale/uk'), antd: () => import('antd/locale/uk_UA') },
    ur: { dayjs: () => import('dayjs/locale/ur'), antd: () => import('antd/locale/ur_PK') },
    'uz-latn': { dayjs: () => import('dayjs/locale/uz-latn') },
    uz: { dayjs: () => import('dayjs/locale/uz'), antd: () => import('antd/locale/uz_UZ') },
    vi: { dayjs: () => import('dayjs/locale/vi'), antd: () => import('antd/locale/vi_VN') },
    'x-pseudo': { dayjs: () => import('dayjs/locale/x-pseudo') },
    yo: { dayjs: () => import('dayjs/locale/yo') },
    'zh-cn': { dayjs: () => import('dayjs/locale/zh-cn'), antd: () => import('antd/locale/zh_CN') },
    'zh-hk': { dayjs: () => import('dayjs/locale/zh-hk'), antd: () => import('antd/locale/zh_HK') },
    'zh-tw': { dayjs: () => import('dayjs/locale/zh-tw'), antd: () => import('antd/locale/zh_TW') },
    zh: { dayjs: () => import('dayjs/locale/zh') },
    'oc-lnc': { dayjs: () => import('dayjs/locale/oc-lnc') },
    nn: { dayjs: () => import('dayjs/locale/nn') },
    'pa-in': { dayjs: () => import('dayjs/locale/pa-in') },
}

const loadLocale = async (locale: string) => {
    try {
        const { dayjs: loadDayjs, antd: loadAntd } = localeMap[locale] || localeMap['en']
        await loadDayjs()
        const antdLocale = loadAntd ? await loadAntd() : await localeMap['en'].antd!()
        dayjs.locale(locale)
        return antdLocale.default
    } catch (error) {
        console.error(`Failed to load locales for ${locale}:`, error)
        return localeMap['en'].antd!().then((module) => module.default)
    }
}

const Main = () => {
    const config = useConfig()
    const [antdLocale, setAntdLocale] = useState<any | undefined>(undefined)

    useEffect(() => {
        if (!config?.locale) return
        const locale = config?.locale || 'en'
        loadLocale(locale).then((antd) => setAntdLocale(antd))
    }, [config])

    return (
        <ThemeProvider>
            <ThemeContext.Consumer>
                {({ theme }) => (
                    <AntdConfigProvider locale={antdLocale} theme={theme}>
                        <DispatchProvider>
                            <NotificationProvider>
                                <Router>
                                    <App />
                                </Router>
                            </NotificationProvider>
                        </DispatchProvider>
                    </AntdConfigProvider>
                )}
            </ThemeContext.Consumer>
        </ThemeProvider>
    )
}

ReactDOM.createRoot(document.getElementById('root')!).render(
    <React.StrictMode>
        <ConfigProvider>
            <Main />
        </ConfigProvider>
    </React.StrictMode>,
)
