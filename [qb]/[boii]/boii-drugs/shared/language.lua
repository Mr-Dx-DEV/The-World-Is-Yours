----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Language = {
    Debug = {
        ['targetmissingdata'] = 'Someone targeted a plant and the data could not be found!' -- Debug server side print
    },
    Alerts = {
        ['notif'] = '10-66: Suspicious Person in Area!', -- Notification
        ['blip'] = '10-66: Suspicious Person in Area!' -- Blip text 
    },
    XP = {
        ['commandtext'] = 'Displays your current drug manufacturing xp.', -- Command text
        ['xplevelnotif'] = 'Drug Manufacturing:', -- Notification
    },
    Targeting = {
        ['plantsicon'] = 'fa-solid fa-cannabis', -- Icon used by qb-target for hydrochloric location visit; https://fontawesome.com to change
        ['plantslabel'] = 'Check Plant', -- Label used by qb-target for hydrochloric location
        ['hydroicon'] = 'fas fa-biohazard', -- Icon used by qb-target for hydrochloric location visit; https://fontawesome.com to change
        ['hydrolabel'] = 'Collect Hydrochloric Acid', -- Label used by qb-target for hydrochloric location
        ['methyicon'] = 'fas fa-biohazard', -- Icon used by qb-target for methylamine location visit; https://fontawesome.com to change
        ['methylabel'] = 'Collect Methylamine', -- Label used by qb-target for methylamine location
        ['acetoneicon'] = 'fas fa-box', -- Icon used by qb-target for acetone box location visit; https://fontawesome.com to change
        ['acetonelabel'] = 'Search Through Box', -- Label used by qb-target for acetone box location
        ['prospecticon'] = 'fa-solid fa-person-digging', -- Icon used by qb-target for prospecting location visit; https://fontawesome.com to change
        ['prospectlabel'] = 'Prospect Rock', -- Label used by qb-target for prospecting location
        ['cocaicon'] = 'fas fa-cannabis', -- Icon used by qb-target for coca plants visit; https://fontawesome.com to change
        ['cocalabel'] = 'Harvest Coca Plants', -- Label used by qb-target for coca plants
        ['gasolineicon'] = 'fab fa-gripfire', -- Icon used by qb-target for illegal gasoline location visit; https://fontawesome.com to change
        ['gasolinelabel'] = 'Steal Gasoline', -- Label used by qb-target for illegal gasoline location
        ['carticon'] = 'fab fa-drupal', -- Icon used by qb-target for illegal gasoline location visit; https://fontawesome.com to change
        ['cartlabel'] = 'Search Airplane Cart', -- Label used by qb-target for illegal gasoline location
        ['matsicon'] = 'fab fa-drupal', -- Icon used by qb-target for building materials location visit; https://fontawesome.com to change
        ['matslabel'] = 'Search Through Materials', -- Label used by qb-target for building materials location
        ['opiumicon'] = 'fas fa-cannabis', -- Icon used by qb-target for opium plants visit; https://fontawesome.com to change
        ['opiumlabel'] = 'Harvest Poppies', -- Label used by qb-target for opium plants
        ['ethericon'] = 'fab fa-gripfire', -- Icon used by qb-target for ether location visit; https://fontawesome.com to change
        ['etherlabel'] = 'Collect Petroleum Ether', -- Label used by qb-target for ether location
        ['offerdrugsicon'] = 'fa-solid fa-comment', -- Icon used by qb-target for offering drugs to ped visit; https://fontawesome.com to change
        ['offerdrugslabel'] = 'Offer Drugs', -- Label used by qb-target for offering drugs
    },
    DrugMaterials = {
        Shared = {
            Hydrochloric = {
                ['nojerrycan'] = 'You cant collect from here without a '..Config.DrugMaterials.Shared.Hydrochloric.Required.label..'..', -- Notification
                ['enoughjerrycan'] = 'You dont have enough '..Config.DrugMaterials.Shared.Hydrochloric.Required.label..'s..', -- Notification
                ['successnoxp'] = 'You collected some '..Config.DrugMaterials.Shared.Hydrochloric.Return.label..'!', -- Notification
                ['failnoxp'] = 'You accidently spilled the acid..', -- Notification
                ['successxp'] = 'You collected some '..Config.DrugMaterials.Shared.Hydrochloric.Return.label..' and gained some experience in the process!', -- Notification
                ['failxp'] = 'You accidently spilled the acid and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Collecting Hydrochloric Acid..', -- Progressbar
            },
            ConstructionSite = {
                ['successnoxp'] = 'You found some useful materials!', -- Notification
                ['failnoxp'] = 'You didnt find anything of use here..', -- Notification
                ['successxp'] = 'You found some useful materials and gained some experience!', -- Notification
                ['failxp'] = 'You didnt find anything of use here and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Searching For Materials..', -- Progressbar
            },
        },
        Heroin = {
            Opium = {
                ['notool'] = 'You need a '..Config.DrugMaterials.Heroin.Opium.Required.label..'..', -- Notification
                ['successnoxp'] = 'You collected some opium sap!', -- Notification
                ['failnoxp'] = 'You damaged the plant..', -- Notification
                ['successxp'] = 'You collected some opium sap and gained some experience in the process!', -- Notification
                ['failxp'] = 'You damaged the plant and lost some experience for wasting time..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already collecting something..', -- Notification
                ['collect'] = 'Collecting Opium Sap..', -- Progressbar
            },
            Ether = {
                ['nojerrycan'] = 'You cant collect from here without a '..Config.DrugMaterials.Heroin.Ether.Required.label..'..', -- Notification
                ['enoughjerrycan'] = 'You dont have enough '..Config.DrugMaterials.Heroin.Ether.Required.label..'s..', -- Notification
                ['successnoxp'] = 'You collected some '..Config.DrugMaterials.Heroin.Ether.Return.label..'!', -- Notification
                ['failnoxp'] = 'You accidently spilled the ether..', -- Notification
                ['successxp'] = 'You collected some '..Config.DrugMaterials.Heroin.Ether.Return.label..' and gained some experience in the process!', -- Notification
                ['failxp'] = 'You accidently spilled the ether and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Collecting Ether..', -- Progressbar
            },
        },
        Meth = {
            Methylamine = {
                ['nojerrycan'] = 'You cant collect from here without a '..Config.DrugMaterials.Meth.Methylamine.Required.label..'..', -- Notification
                ['enoughjerrycan'] = 'You dont have enough '..Config.DrugMaterials.Meth.Methylamine.Required.label..'s..', -- Notification
                ['successnoxp'] = 'You collected some '..Config.DrugMaterials.Meth.Methylamine.Return.label..'!', -- Notification
                ['failnoxp'] = 'You accidently spilled the methylamine..', -- Notification
                ['successxp'] = 'You collected some '..Config.DrugMaterials.Meth.Methylamine.Return.label..' and gained some experience in the process!', -- Notification
                ['failxp'] = 'You accidently spilled the methylamine and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Collecting Methylamine..', -- Progressbar
            },
            Acetone = {
                ['successnoxp'] = 'You found something inside the box!', -- Notification
                ['failnoxp'] = 'You didnt find anything of use here..', -- Notification
                ['successxp'] = 'You found something inside the box and gained some experience!', -- Notification
                ['failxp'] = 'You didnt find anything of use here and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Searching Box..', -- Progressbar
            },
            Lithium = {
                ['notool'] = 'You need a '..Config.DrugMaterials.Meth.Lithium.Required.label..'..', -- Notification
                ['successnoxp'] = 'You found something whilst digging!', -- Notification
                ['failnoxp'] = 'You didnt find anything useful here..', -- Notification
                ['successxp'] = 'You found something whilst digging and gained some experience in the process!', -- Notification
                ['failxp'] = 'You didnt find anything of use here and lost some experience for wasting time..', -- Notification
                ['alreadysearching'] = 'You are already collecting something..', -- Notification
                ['collect'] = 'Prospecting Rocks..', -- Progressbar
            },
        },
        Cocaine = {
            CocaPlants = {
                ['notool'] = 'You need a pair of '..Config.DrugMaterials.Cocaine.CocaPlants.Required.label..'..', -- Notification
                ['successnoxp'] = 'You collected some coca leaves!', -- Notification
                ['failnoxp'] = 'You damaged the plant..', -- Notification
                ['successxp'] = 'You collected some coca leaves and gained some experience in the process!', -- Notification
                ['failxp'] = 'You damaged the plant and lost some experience for wasting time..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already collecting something..', -- Notification
                ['collect'] = 'Collecting Coca Leaves..', -- Progressbar
            },
            IllegalGasoline = {
                ['nojerrycan'] = 'You cant collect from here without a '..Config.DrugMaterials.Cocaine.IllegalGasoline.Required.label..'..', -- Notification
                ['enoughjerrycan'] = 'You dont have enough '..Config.DrugMaterials.Cocaine.IllegalGasoline.Required.label..'s..', -- Notification
                ['successnoxp'] = 'You collected some '..Config.DrugMaterials.Cocaine.IllegalGasoline.Return.label..'!', -- Notification
                ['failnoxp'] = 'You accidently spilled the gasoline..', -- Notification
                ['successxp'] = 'You collected some '..Config.DrugMaterials.Cocaine.IllegalGasoline.Return.label..' and gained some experience in the process!', -- Notification
                ['failxp'] = 'You accidently spilled the gasoline and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Collecting Gasoline..', -- Progressbar
            },
            Benzocaine = {
                ['successnoxp'] = 'You found something inside the cart!', -- Notification
                ['failnoxp'] = 'You didnt find anything of use here..', -- Notification
                ['successxp'] = 'You found something inside the cart and gained some experience!', -- Notification
                ['failxp'] = 'You didnt find anything of use here and lost some experience for wasting time..', -- Notification
                ['cooldown'] = 'You have already searched this location.. come back later..', -- Notification
                ['noservice'] = 'Service jobs are not allowed to search here. Respect the law!', -- Notification
                ['noblacklist'] = 'Your job is not allowed to search here..', -- Notification
                ['alreadysearching'] = 'You are already searching a location..', -- Notification
                ['collect'] = 'Searching Cart..', -- Progressbar
            },
            Water = {
                ['fail'] = 'You need to be in water to fill up your '..Config.DrugMaterials.Cocaine.Water.Required.label..'..', -- Notification
                ['success'] = 'You filled a '..Config.DrugMaterials.Cocaine.Water.Return.label..'!', -- Notification
                ['alreadycollecting'] = 'You are already collecting water..', -- Notification
                ['collect'] = 'Collecting Water..', -- Progressbar
            }
        }
    },
    Processing = {
        Shared = {
            ['successnoxp'] = 'You exchanged some drug materials!', -- Notification
            ['successxp'] = 'You exchanged some drug materials and earned some experience!', -- Notification
            ['alreadyprocessing'] = 'You are already exchanging materials..', -- Notification
            ['process'] = 'Exchanging Materials..', -- Progressbar
        },
        Heroin = {
            Morphine = {
                ['processormorphineheader'] = 'Morphine Processing', -- Menu header 
                ['processormorphineheadertext'] = 'Ill take those drug materials from you!', -- Menu header text
                ['processormorphineheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
                ['processingmorphineheader'] = 'Exchange Materials', -- Menu header   
                ['processingmorphineheadertext'] = 'Required:</p>'..Config.Processing.Heroin.Morphine.Required['1'].amount..'x '..Config.Processing.Heroin.Morphine.Required['1'].label..'</p>'..Config.Processing.Heroin.Morphine.Required['2'].amount..'x '..Config.Processing.Heroin.Morphine.Required['2'].label..'</p>'..Config.Processing.Heroin.Morphine.Required['3'].amount..'x '..Config.Processing.Heroin.Morphine.Required['3'].label..'', -- Menu header
                ['processingmorphineheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
                ['processorclosed'] = 'Man we dont need anything right now.. come back later between '..Config.Processing.Heroin.Morphine.Times.Start..' and '..Config.Processing.Heroin.Morphine.Times.End..' ..', -- Notification
                ['enoughmorphine1'] = 'Looks like you dont have enough '..Config.Processing.Heroin.Morphine.Required['1'].label..'.. check your pockets..', -- Notification
                ['nomorphine1'] = 'Looks like you dont have any '..Config.Processing.Heroin.Morphine.Required['1'].label..'..', -- Notification
                ['enoughmorphine2'] = 'Looks like you dont have enough '..Config.Processing.Heroin.Morphine.Required['2'].label..'.. check your pockets..', -- Notification
                ['nomorphine2'] = 'Looks like you dont have any '..Config.Processing.Heroin.Morphine.Required['2'].label..'..', -- Notification
                ['enoughmorphine3'] = 'Looks like you dont have enough '..Config.Processing.Heroin.Morphine.Required['3'].label..'.. check your pockets..', -- Notification
                ['nomorphine3'] = 'Looks like you dont have any '..Config.Processing.Heroin.Morphine.Required['3'].label..'..', -- Notification
            },
            HeroinBase = {
                ['processorheroinbaseheader'] = 'Heroin Base Processing', -- Menu header 
                ['processorheroinbaseheadertext'] = 'Ill take those drug materials from you!', -- Menu header text
                ['processorheroinbaseheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
                ['processingheroinbaseheader'] = 'Exchange Materials', -- Menu header   
                ['processingheroinbaseheadertext'] = 'Required:</p>'..Config.Processing.Heroin.HeroinBase.Required['1'].amount..'x '..Config.Processing.Heroin.HeroinBase.Required['1'].label..'</p>'..Config.Processing.Heroin.HeroinBase.Required['2'].amount..'x '..Config.Processing.Heroin.HeroinBase.Required['2'].label..'</p>'..Config.Processing.Heroin.HeroinBase.Required['3'].amount..'x '..Config.Processing.Heroin.HeroinBase.Required['3'].label..'', -- Menu header
                ['processingheroinbaseheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
                ['processorclosed'] = 'Man we dont need anything right now.. come back later between '..Config.Processing.Heroin.HeroinBase.Times.Start..' and '..Config.Processing.Heroin.HeroinBase.Times.End..' ..', -- Notification
                ['enoughheroinbase1'] = 'Looks like you dont have enough '..Config.Processing.Heroin.HeroinBase.Required['1'].label..'.. check your pockets..', -- Notification
                ['noheroinbase1'] = 'Looks like you dont have any '..Config.Processing.Heroin.HeroinBase.Required['1'].label..'..', -- Notification
                ['enoughheroinbase2'] = 'Looks like you dont have enough '..Config.Processing.Heroin.HeroinBase.Required['2'].label..'.. check your pockets..', -- Notification
                ['noheroinbase2'] = 'Looks like you dont have any '..Config.Processing.Heroin.HeroinBase.Required['2'].label..'..', -- Notification
                ['enoughheroinbase3'] = 'Looks like you dont have enough '..Config.Processing.Heroin.HeroinBase.Required['3'].label..'.. check your pockets..', -- Notification
                ['noheroinbase3'] = 'Looks like you dont have any '..Config.Processing.Heroin.HeroinBase.Required['3'].label..'..', -- Notification
            },
            Heroin= {
                ['processorheroinheader'] = 'Heroin Processing', -- Menu header 
                ['processorheroinheadertext'] = 'Ill take those drug materials from you!', -- Menu header text
                ['processorheroinheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
                ['processingheroinheader'] = 'Exchange Materials', -- Menu header   
                ['processingheroinheadertext'] = 'Required:</p>'..Config.Processing.Heroin.Heroin.Required['1'].amount..'x '..Config.Processing.Heroin.Heroin.Required['1'].label..'</p>'..Config.Processing.Heroin.Heroin.Required['2'].amount..'x '..Config.Processing.Heroin.Heroin.Required['2'].label..'</p>'..Config.Processing.Heroin.Heroin.Required['3'].amount..'x '..Config.Processing.Heroin.Heroin.Required['3'].label..'', -- Menu header
                ['processingheroinheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
                ['processorclosed'] = 'Man we dont need anything right now.. come back later between '..Config.Processing.Heroin.Heroin.Times.Start..' and '..Config.Processing.Heroin.Heroin.Times.End..' ..', -- Notification
                ['enoughheroin1'] = 'Looks like you dont have enough '..Config.Processing.Heroin.Heroin.Required['1'].label..'.. check your pockets..', -- Notification
                ['noheroin1'] = 'Looks like you dont have any '..Config.Processing.Heroin.Heroin.Required['1'].label..'..', -- Notification
                ['enoughheroin2'] = 'Looks like you dont have enough '..Config.Processing.Heroin.Heroin.Required['2'].label..'.. check your pockets..', -- Notification
                ['noheroin2'] = 'Looks like you dont have any '..Config.Processing.Heroin.Heroin.Required['2'].label..'..', -- Notification
                ['enoughheroin3'] = 'Looks like you dont have enough '..Config.Processing.Heroin.Heroin.Required['3'].label..'.. check your pockets..', -- Notification
                ['noheroin3'] = 'Looks like you dont have any '..Config.Processing.Heroin.Heroin.Required['3'].label..'..', -- Notification
            },
        },
        Meth = {
            Meth = {
                ['processormethheader'] = 'Meth Processing', -- Menu header 
                ['processormethheadertext'] = 'Ill take those drug materials from you!', -- Menu header text
                ['processormethheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
                ['processingmethheader'] = 'Exchange Materials', -- Menu header   
                ['processingmethheadertext'] = 'Required:</p>'..Config.Processing.Meth.Meth.Required['1'].amount..'x '..Config.Processing.Meth.Meth.Required['1'].label..'</p>'..Config.Processing.Meth.Meth.Required['2'].amount..'x '..Config.Processing.Meth.Meth.Required['2'].label..'</p>'..Config.Processing.Meth.Meth.Required['3'].amount..'x '..Config.Processing.Meth.Meth.Required['3'].label..'</p>'..Config.Processing.Meth.Meth.Required['4'].amount..'x '..Config.Processing.Meth.Meth.Required['4'].label..'', -- Menu header
                ['processingmethheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
                ['processorclosed'] = 'Man we dont need anything right now.. come back later between '..Config.Processing.Meth.Meth.Times.Start..' and '..Config.Processing.Meth.Meth.Times.End..' ..', -- Notification
                ['enoughmeth1'] = 'Looks like you dont have enough '..Config.Processing.Meth.Meth.Required['1'].label..'.. check your pockets..', -- Notification
                ['nometh1'] = 'Looks like you dont have any '..Config.Processing.Meth.Meth.Required['1'].label..'..', -- Notification
                ['enoughmeth2'] = 'Looks like you dont have enough '..Config.Processing.Meth.Meth.Required['2'].label..'.. check your pockets..', -- Notification
                ['nometh2'] = 'Looks like you dont have any '..Config.Processing.Meth.Meth.Required['2'].label..'..', -- Notification
                ['enoughmeth3'] = 'Looks like you dont have enough '..Config.Processing.Meth.Meth.Required['3'].label..'.. check your pockets..', -- Notification
                ['nometh3'] = 'Looks like you dont have any '..Config.Processing.Meth.Meth.Required['3'].label..'..', -- Notification
                ['enoughmeth4'] = 'Looks like you dont have enough '..Config.Processing.Meth.Meth.Required['4'].label..'.. check your pockets..', -- Notification
                ['nometh4'] = 'Looks like you dont have any '..Config.Processing.Meth.Meth.Required['4'].label..'..', -- Notification
            }
        },
        Cocaine = {
            Crack = {
                ['processorcrackheader'] = 'Cocaine Processing', -- Menu header 
                ['processorcrackheadertext'] = 'Ill take those drug materials from you!', -- Menu header text
                ['processorcrackheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
                ['processingcrackheader'] = 'Exchange Materials', -- Menu header   
                ['processingcrackheadertext'] = 'Required:</p>'..Config.Processing.Cocaine.Crack.Required['1'].amount..'x '..Config.Processing.Cocaine.Crack.Required['1'].label..'</p>'..Config.Processing.Cocaine.Crack.Required['2'].amount..'x '..Config.Processing.Cocaine.Crack.Required['2'].label..'</p>'..Config.Processing.Cocaine.Crack.Required['3'].amount..'x '..Config.Processing.Cocaine.Crack.Required['3'].label..'', -- Menu header
                ['processingcrackheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
                ['processorclosed'] = 'Man we dont need anything right now.. come back later between '..Config.Processing.Cocaine.Crack.Times.Start..' and '..Config.Processing.Cocaine.Crack.Times.End..' ..', -- Notification
                ['enoughcrack1'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Crack.Required['1'].label..'.. check your pockets..', -- Notification
                ['nocrack1'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Crack.Required['1'].label..'..', -- Notification
                ['enoughcrack2'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Crack.Required['2'].label..'.. check your pockets..', -- Notification
                ['nocrack2'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Crack.Required['2'].label..'..', -- Notification
                ['enoughcrack3'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Crack.Required['3'].label..'.. check your pockets..', -- Notification
                ['nocrack3'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Crack.Required['3'].label..'..', -- Notification
            },
            Cocaine = {
                ['processorcocaineheader'] = 'Cocaine Processing', -- Menu header 
                ['processorcocaineheadertext'] = 'Ill take those drug materials from you!', -- Menu header text
                ['processorcocaineheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
                ['processingcocaineheader'] = 'Exchange Materials', -- Menu header   
                ['processingcocaineheadertext'] = 'Required:</p>'..Config.Processing.Cocaine.Cocaine.Required['1'].amount..'x '..Config.Processing.Cocaine.Cocaine.Required['1'].label..'</p>'..Config.Processing.Cocaine.Cocaine.Required['2'].amount..'x '..Config.Processing.Cocaine.Cocaine.Required['2'].label..'</p>'..Config.Processing.Cocaine.Cocaine.Required['3'].amount..'x '..Config.Processing.Cocaine.Cocaine.Required['3'].label..'</p>'..Config.Processing.Cocaine.Cocaine.Required['4'].amount..'x '..Config.Processing.Cocaine.Cocaine.Required['4'].label..'', -- Menu header
                ['processingcocaineheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
                ['processorclosed'] = 'Man we dont need anything right now.. come back later between '..Config.Processing.Cocaine.Cocaine.Times.Start..' and '..Config.Processing.Cocaine.Cocaine.Times.End..' ..', -- Notification
                ['enoughcocaine1'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Cocaine.Required['1'].label..'.. check your pockets..', -- Notification
                ['nococaine1'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Cocaine.Required['1'].label..'..', -- Notification
                ['enoughcocaine2'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Cocaine.Required['2'].label..'.. check your pockets..', -- Notification
                ['nococaine2'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Cocaine.Required['2'].label..'..', -- Notification
                ['enoughcocaine3'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Cocaine.Required['3'].label..'.. check your pockets..', -- Notification
                ['nococaine3'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Cocaine.Required['3'].label..'..', -- Notification
                ['enoughcocaine4'] = 'Looks like you dont have enough '..Config.Processing.Cocaine.Cocaine.Required['4'].label..'.. check your pockets..', -- Notification
                ['nococaine4'] = 'Looks like you dont have any '..Config.Processing.Cocaine.Cocaine.Required['4'].label..'..', -- Notification
            }
        },
    },
    DrugCutting = {
        Shared = {
            ['cuttingheader'] = 'Cutting Kit', -- Menu header
            ['cuttingheadertext'] = 'Cut your weight into something usable!', -- Menu header text
            ['cuttingheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
            ['nocutkit'] = 'You cant cut drugs without a '..Config.DrugCutting.Shared.Required['1'].label..'..', -- Notification
            ['noscales'] = 'You cant cut drugs without a set of '..Config.DrugCutting.Shared.Required['2'].label..'..', -- Notification
            ['cutlowxp'] = 'You cut some drugs but you lost a little in the process due to your lack of experience!', -- Notification
            ['cutxp'] = 'You successfully cut some drugs and earned some xp!', -- Notification
            ['cutnoxp'] = 'You successfully cut some drugs!', -- Notification
            ['alreadycutting'] = 'You are already cutting drugs..', -- Notification
            ['cutdrugs'] = 'Cutting Drugs..', -- Progressbar
        },
        Heroin = {
            Morphine = {
                ['enoughbags'] = 'You dont have enough '..Config.DrugCutting.Heroin.Morphine.Required['1'].label..'..', -- Notification
                ['nobags'] = 'You dont have any '..Config.DrugCutting.Heroin.Morphine.Required['1'].label..'..', -- Notification
            },
            Heroin = {
                ['enoughbags'] = 'You dont have enough '..Config.DrugCutting.Heroin.Heroin.Required['1'].label..'..', -- Notification
                ['nobags'] = 'You dont have any '..Config.DrugCutting.Heroin.Heroin.Required['1'].label..'..', -- Notification
            }
        },
        Meth = {
            ['enoughbags'] = 'You dont have enough '..Config.DrugCutting.Meth.Meth.Required['1'].label..'..', -- Notification
            ['nobags'] = 'You dont have any '..Config.DrugCutting.Meth.Meth.Required['1'].label..'..', -- Notification
        },
        Cocaine = {
            Cocaine = {
                ['enoughbags'] = 'You dont have enough '..Config.DrugCutting.Cocaine.Cocaine.Required['1'].label..'..', -- Notification
                ['nobags'] = 'You dont have any '..Config.DrugCutting.Cocaine.Cocaine.Required['1'].label..'..' -- Notification
            }
        }
    },
    PrepDrugs = {
        Heroin = {
            Morphine = {
                ['nowater'] = 'You cant prepare '..Config.PrepDrugs.Heroin.Morphine.Return.label..' without '..Config.PrepDrugs.Heroin.Morphine.Required['1'].label..'..', -- Notification
                ['novial'] = 'You cant prepare '..Config.PrepDrugs.Heroin.Morphine.Return.label..' without a '..Config.PrepDrugs.Heroin.Morphine.Required['2'].label..'..', -- Notification
                ['prepareddrug'] = 'You prepared some '..Config.PrepDrugs.Heroin.Morphine.Return.label..'!', -- Notification
                ['alreadyprepping'] = 'You are already preparing something..', -- Notification
                ['prepdrug'] = 'Preparing Morphine..',  -- Progressbar
            },
            Heroin = {
                ['nowater'] = 'You cant prepare '..Config.PrepDrugs.Heroin.Heroin.Return.label..' without '..Config.PrepDrugs.Heroin.Heroin.Required['1'].label..'..', -- Notification
                ['novial'] = 'You cant prepare '..Config.PrepDrugs.Heroin.Heroin.Return.label..' without a '..Config.PrepDrugs.Heroin.Heroin.Required['2'].label..'..', -- Notification
                ['prepareddrug'] = 'You prepared some '..Config.PrepDrugs.Heroin.Heroin.Return.label..'!', -- Notification
                ['alreadyprepping'] = 'You are already preparing something..', -- Notification
                ['prepdrug'] = 'Preparing Heroin..',  -- Progressbar
            }
        }
    },
    TakeDrugs = {
        Heroin = {
            Morphine = {
                ['nosyringe'] = 'You cant inject without a '..Config.TakeDrugs.Heroin.Morphine.Required.label..'..', -- Notification
                ['takedrug'] = 'Taking Morphine..' -- Progressbar
            },
            Heroin = {
                ['nosyringe'] = 'You cant inject without a '..Config.TakeDrugs.Heroin.Heroin.Required.label..'..', -- Notification
                ['takedrug'] = 'Taking Heroin..' -- Progressbar
            },
        },
        Meth = {
            Meth = {
                ['takedrug'] = 'Snorting Meth..' -- Progressbar
            },
        },
        Cocaine = {
            Crack = {
                ['nolighter'] = 'You cant smoke without a '..Config.TakeDrugs.Cocaine.Crack.Required.label..'..', -- Notification
                ['takedrug'] = 'Smoking Crack..' -- Progressbar
            },
            Cocaine = {
                ['takedrug'] = 'Sniffing Coke..' -- Progressbar
            },
        },
    },
    Weed = {
        Planting = {
            ['tooclose'] = 'You are too close to another plant..', -- Notification
            ['wrongsoil'] = 'You cant plant here look for some more fertile land..', -- Notification
            ['plantedseednoxp'] = 'You planted a seed successfully!', -- Notification
            ['plantedseedxp'] = 'You successfully planted a seed and earned some xp!', -- Notification
            ['notrowel'] = 'You cant plant seeds without a '..Config.Plants.Outdoor.Actions.Plant.Required.label..'..', -- Notification
            ['nofertilizer'] = 'You cant feed plants without '..Config.Plants.Outdoor.Actions.Feed.Required.label..'..', -- Notification
            ['nowater'] = 'You cant water plants without '..Config.Plants.Outdoor.Actions.Water.Required.label..'..', -- Notification
            ['noshears'] = 'You cant trim plants without '..Config.Plants.Outdoor.Actions.Harvest.Required.label..'..', -- Notification
            ['harvestxp'] = 'You successfully harvested a plant and earned some xp!', -- Notification
            ['harvestnoxp'] = 'You successfully harvested a plant!', -- Notification
            ['destroyedplant'] = 'You successfully destroyed a plant!', -- Notification
            ['harvestplant'] = 'Harvesting Plant..', -- Progressbar
            ['destroyplant'] = 'Destroying Plant..', -- Progressbar
            ['feedplant'] = 'Feeding Plant..', -- Progressbar
            ['waterplant'] = 'Watering Plant..', -- Progressbar
            ['plantseed'] = 'Planting Seed..' -- Progressbar
        },
        Trimming = {
            ['noshears'] = 'You cant trim plants without a pair of '..Config.Plants.Outdoor.Actions.Trimming.Required['1'].label..'..', -- Notification
            ['noscales'] = 'You cant trim plants without a set of '..Config.Plants.Outdoor.Actions.Trimming.Required['2'].label..'..', -- Notification
            ['enoughbags'] = 'You dont have enough '..Config.Plants.Outdoor.Actions.Trimming.Required['3'].label..'..', -- Notification
            ['nobags'] = 'You dont have any '..Config.Plants.Outdoor.Actions.Trimming.Required['3'].label..'..', -- Notification
            ['trimxp'] = 'You successfully trimmed some weed and earned some xp!', -- Notification
            ['trimnoxp'] = 'You successfully trimmed some weed!', -- Notification
            ['trimweed'] = 'Trimming Weed..' -- Progressbar
        },
        Rolling = {
            ['nogrinder'] = 'You cant roll joints without '..Config.Plants.Outdoor.Actions.Rolling.Required['1'].label..'..', -- Notification
            ['nopapers'] = 'You cant roll joints without '..Config.Plants.Outdoor.Actions.Rolling.Required['2'].label..'..', -- Notification
            ['enoughpapers'] = 'You dont have enough '..Config.Plants.Outdoor.Actions.Rolling.Required['2'].label..'..', -- Notification
            ['rollxp'] = 'You successfully rolled some joints and earned some xp!', -- Notification
            ['norollxp'] = 'You successfully rolled some joints!', -- Notification
            ['rolljoint'] = 'Rolling Joints..' -- Progressbar
        },
        Smoking = {
            ['nolighter'] = 'You cant smoke without a '..Config.Plants.Outdoor.Actions.Smoking.Required.label..'..', -- Notification
            ['smokejoint'] = 'Hitting Blunt..' -- Progressbar
        }
    },
    DrugSales = {
        Shared = {
            ['nodrugs'] = 'You dont have any drugs with you..', -- Notification
            ['enoughdrugs'] = 'You dont have enough drugs to make the deal..', -- Notification
            ['cantsell'] = 'You cant street sell and deliver drugs at the same time..', -- Notification
            ['novehicle'] = 'You cant sell drugs from a vehicle..', -- Notification
            ['noservice'] = 'Service jobs are not allowed to sell drugs. Respect the law!', -- Notification
            ['noblacklist'] = 'Your job is not allowed to sell drugs..', -- Notification
        },
        Menus = {
            ['phoneheader'] = 'Burner Phone', -- Menu header   
            ['phoneheadertext'] = 'Start street selling or make deliveries!', -- Menu header text
            ['phoneheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
            ['streetsellingheader'] = 'Toggle Street Selling', -- Menu header  
            ['streetsellingheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
            ['deliveriesheader'] = 'Request Delivery', -- Menu header 
            ['deliveriesheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
        },
        Street = {
            ['startedselling'] = 'You started selling drugs! Go speak to some locals!', -- Notification
            ['stoppedselling'] = 'You stopped selling drugs.', -- Notification
            ['enoughcops'] = 'Not enough on duty officers! Required: ('..Config.DrugSales.Street.Cops..')', -- Notification
            ['timer'] = 'You can only sell between '..Config.DrugSales.Street.Times.Start..' and '..Config.DrugSales.Street.Times.End..'..', -- Notification
            ['alreadysold'] = 'You have already tried to offer this person drugs..', -- Notification
            ['nosteal'] = 'You didnt have any drugs they could steal..', -- Notification
            ['enoughsteal'] = 'Your didnt have enough drugs worth stealing..' -- Notification
        },
        Deliveries = {
            ['startedselling'] = 'You requested a delivery! Wait for a customer!', -- Notification
            ['stoppedselling'] = 'You stopped your delivery!', -- Notification
            ['enoughcops'] = 'Not enough on duty officers! Required: ('..Config.DrugSales.Deliveries.Cops..')', -- Notification
            ['timer'] = 'You can only sell between '..Config.DrugSales.Deliveries.Times.Start..' and '..Config.DrugSales.Deliveries.Times.End..'..', -- Notification
            ['alreadysold'] = 'You have already tried to deliver to this person..', -- Notification
            ['cooldowntimer'] = 'You can only request a delivery once every ('..Config.DrugSales.Deliveries.Cooldown..') mins..', -- Notification
            ['customerready'] = 'A customer is waiting for their delivery!', -- Notification
            ['nodelivery'] = 'Im not intersted in buying anything from you.. leave..', -- Notification
            ['saleblip'] = 'Delivery Customer', -- Blip string
        },
    },
    Stores = {
        Weed = {
            SmokeShop = {
                ['nodrugs'] = 'I cant buy air.. come back with some green!', -- Notification
                -- Main
                ['smokeshopheader'] = 'Smoke On The Water', -- Menu header   
                ['smokeshopheadertext'] = 'Buy your smoke gear or sell us some stuff!', -- Menu header
                ['smokeshopheadericon'] = 'fa-solid fa-shop', -- Store header
                -- Sell
                ['smokeshopsellheader'] = 'Sell To Store!', -- Menu header   
                ['smokeshopsellheadertext'] = 'Here you can sell your bags for cash!', -- Menu header
                ['smokeshopsellheadericon'] = 'fas fa-cannabis', -- Store header
                ['nobags'] = 'You dont have any bags to sell..', -- Notification
                -- Browse
                ['smokeshopbrowseheader'] = 'Browse The Store!', -- Menu header   
                ['smokeshopbrowseheadertext'] = 'Here you can purchase smoking equipment!', -- Menu header
                ['smokeshopbrowseheadericon'] = 'fa-solid fa-basket-shopping', -- Store header
                -- Timer
                ['timer'] = 'Dude my shift hasnt started yet. Come back between '..Config.Stores.Weed.SmokeShop.Times.Start..' and '..Config.Stores.Weed.SmokeShop.Times.End..'..', -- Notification
                -- Strains
                ['strainheadericon'] = 'fas fa-cannabis', -- Strain header icon
                ['strain1header'] = 'Skunk', -- Store header
                ['strain1headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_skunk']..' per 2g baggy.', -- Store header text
                ['strain2header'] = 'OG-Kush', -- Store header
                ['strain2headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_og-kush']..' per 2g baggy.', -- Store header text
                ['strain3header'] = 'White-Widow', -- Store header
                ['strain3headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_white-widow']..' per 2g baggy.', -- Store header text
                ['strain4header'] = 'AK47', -- Store header
                ['strain4headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_ak47']..' per 2g baggy.', -- Store header text
                ['strain5header'] = 'Amnesia', -- Store header
                ['strain5headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_amnesia']..' per 2g baggy.', -- Store header text
                ['strain6header'] = 'Purple-Haze', -- Store header
                ['strain6headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_purple-haze']..' per 2g baggy.', -- Store header text
                ['strain7header'] = 'Gelato', -- Store header
                ['strain7headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_gelato']..' per 2g baggy.', -- Store header text
                ['strain8header'] = 'Zkittlez', -- Store header
                ['strain8headertext'] = '$'..Config.Stores.Weed.SmokeShop.Drugs.Bags['weed_zkittlez']..' per 2g baggy.' -- Store header text
            }
        },
        Heroin = {
            Pharmacy = {
                ['pharmacyheader'] = 'Pharmacist', -- Menu header 
                ['pharmacyheadertext'] = 'I can sell you some under the counter meds!', -- Menu header text
                ['pharmacyheadericon'] = 'fa-solid fa-capsules', -- Menu header 
                ['pharmacystoreheader'] = 'Purchase Items!', -- Menu header   
                ['pharmacystoreheadertext'] = 'Check what items are in stock here.', -- Menu header
                ['pharmacystoreheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                ['pharmacystorelabel'] = 'Pharmacist', -- Store header
                ['timer'] = 'Cant you see im taking a break? Come back between '..Config.Stores.Heroin.Pharmacy.Times.Start..' and '..Config.Stores.Heroin.Pharmacy.Times.End..' ..', -- Notification
            },
            Morphine = {
                BlackMarket = {
                    ['blackmarketheader'] = 'Black Market', -- Menu header   
                    ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header
                    ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                    ['blackmarketstorelabel'] = 'Black Market', -- Store header
                }
            },
            HeroinBase = {
                BlackMarket = {
                    ['blackmarketheader'] = 'Black Market', -- Menu header   
                    ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header
                    ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                    ['blackmarketstorelabel'] = 'Black Market', -- Store header
                }
            },
            Heroin = {
                BlackMarket = {
                    ['blackmarketheader'] = 'Black Market', -- Menu header   
                    ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header
                    ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                    ['blackmarketstorelabel'] = 'Black Market' -- Store header
                }
            }
        },
        Meth = {
            BlackMarket = {
                ['blackmarketheader'] = 'Black Market', -- Menu header   
                ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header
                ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                ['blackmarketstorelabel'] = 'Black Market' -- Store header
            }
        },
        Cocaine = {
            Cocaine = {
                BlackMarket = {
                    ['blackmarketheader'] = 'Black Market', -- Menu header   
                    ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header
                    ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                    ['blackmarketstorelabel'] = 'Black Market', -- Store header
                }
            },
            Crack = {
                BlackMarket = {
                    ['blackmarketheader'] = 'Black Market', -- Menu header   
                    ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header
                    ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                    ['blackmarketstorelabel'] = 'Black Market' -- Store header
                }
            }
        },
        BulkSelling = {
            ['nodrugs'] = 'I cant buy air.. come back with some goods!', -- Notification
            ['bulkbuyerheader'] = 'Bulk Buyer', -- Menu header   
            ['bulkbuyerheadertext'] = 'Bulk sell your drugs here.', -- Menu header text
            ['bulkbuyerheadericon'] = 'fa-solid fa-user-ninja', -- Menu header icon
            ['bulkbuyerbagsheader'] = 'Bulk Sell Bags', -- Menu header   
            ['bulkbuyerbagsheadertext'] = 'Bulk sell your baggies here!', -- Menu header text
            ['bulkbuyerbagsheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
            ['bulkbuyerouncesheader'] = 'Bulk Sell Ounces', -- Menu header   
            ['bulkbuyerouncesheadertext'] = 'Bulk sell your ounces here!', -- Menu header text
            ['bulkbuyerouncesheadericon'] = 'fa-solid fa-cannabis', -- Menu header icon
            ['timer'] = 'You can only sell between '..Config.Stores.BulkSelling.Times.Start..' and '..Config.Stores.BulkSelling.Times.End..'..', -- Notification
            BlackMarket = {
                ['blackmarketheader'] = 'Black Market', -- Menu header   
                ['blackmarketheadertext'] = 'Check what items are in stock here.', -- Menu header text
                ['blackmarketheadericon'] = 'fa-solid fa-cash-register', -- Menu header icon
                ['blackmarketstorelabel'] = 'Black Market', -- Store header
            }
        }
    },
    Ketamine = {
        Targeting = {
            ['drivericon'] = 'fab fa-drupal', -- QB-Target icon
            ['passengericon'] = 'fab fa-drupal', -- QB-Target icon
            ['vehiclesearchicon'] = 'fab fa-drupal', -- QB-Target icon
            ['driverlabel'] = 'Search Driver', -- QB-Target label
            ['passengerlabel'] = 'Search Passenger', -- QB-Target label
            ['vehiclesearchlabel'] = 'Search Vehicle', -- QB-Target label

        },
        Alerts = {
            ['notif'] = '10-37: Suspicious Vehicle!', -- Notification
            ['blip'] = '10-37: Suspicious Vehicle!' -- Blip text 
        },
        Worker = {
            Menus = {
                Main = {
                    ['header'] = 'Suspicious Worker', -- Menu header
                    ['text'] = 'Looking for a job to do?', -- Menu text
                    ['icon'] = 'fa-solid fa-cannabis', -- Menu icon 
                },
                Info = {
                    ['header'] = 'Request Information', -- Menu header
                    ['text'] = 'Request job information here!', -- Menu text 
                    ['icon'] = 'fa-solid fa-circle-info', -- Menu icon 
                }, 
                Store = {
                    ['header'] = 'Open Store', -- Menu header
                    ['text'] = 'Purchase items here!', -- Menu text
                    ['icon'] = 'fa-solid fa-basket-shopping', -- Menu icon  
                }
            },
            Email = {
                ['nophone'] = 'Looks like you dont have your '..Config.Ketamine.Worker.Emails.Request.Required.label..' with you..', -- Notification
                ['cantemail'] = 'You have already requested the information come back in '..Config.Ketamine.Worker.Emails.Request.Cooldown..'minutes..', -- Notification
                ['emailsent'] = 'Information has been requested please wait for an email!', -- Notification
                ['accepted'] = 'You accepted the job. An email with the information is on its way!' -- Notification
            },
            ['timer'] = 'I dont have any work for you right now. Check back between '..Config.Ketamine.Worker.Times.Open..' and '..Config.Ketamine.Worker.Times.Close..'..', -- Notification
        },
        Email = {
            ['nophone'] = 'Looks like you dont have your '..Config.Ketamine.Worker.Emails.Request.Required.label..' with you..', -- Notification
            ['cantemail'] = 'You have already requested the information come back in '..Config.Ketamine.Worker.Emails.Request.Cooldown..'minutes..', -- Notification
            ['emailsent'] = 'Information has been requested please wait for an email!', -- Notification
            ['accepted'] = 'You accepted the job. An email with the information is on its way!' -- Notification
        },
        Job = {
            ['alreadyon'] = 'You are already on a active job..', -- Notification
            ['jobstart'] = 'The vehicle has been marked on your map! Intercept it!', -- Notification
            ['gotvan'] = 'You collected the vehicle! Disable the tracker!' -- Notification
        },
        Search = {
            ['drivercash'] = 'You found the keys to the truck and some cash in the drivers pockets!', -- Notification
            ['driver'] = 'You found the keys to the truck in the drivers pockets!', -- Notification
            ['passenger'] = 'You found some cash in the passengers pockets!', -- Notification
            ['alreadysearched'] = 'You have already checked their pockets..', -- Notification
            ['noreward'] = 'Their pockets were empty..', -- Notification
        },
        Tracker = {
            ['nojob'] = 'Looks like your not on a job right now..', -- Notification
            ['notracker'] = 'This vehicle does not have a tracker enabled..', -- Notification
            ['hackcd'] = 'Your '..Config.Ketamine.Tracker.Tool.label..' is not ready yet..', -- Notification
            ['busy'] = 'You are already removing a tracker..', -- Notification
            ['wrongveh'] = 'Current vehicle is not the job vehicle..', -- Notification
            ['failed'] = 'Your '..Config.Ketamine.Tracker.Tool.label..' burned out..', -- Notification
            ['success'] = 'You found all the chips! Tracker status:', -- Notification
            ['removed'] = 'You successfully removed the tracker! A delivery location has been marked on your map!', -- Notification
            ['removerconnect'] = 'Connecting Tracking Chip Remover..', -- Progressbar
        },
        Delivery = {
            ['nodelivery'] = 'Looks like your not on a delivery right now..', -- Notification
            ['alreadyon'] = 'You are already on a active delivery..', -- Notification
            ['alreadysearching'] = 'You are already searching a vehicle..', -- Notification
            ['jobstart'] = 'The delivery location has been marked on your map. Lose any heat then drop of the vehicle!', -- Notification
            ['wrongveh'] = 'Current vehicle is not the job vehicle..', -- Notification
            ['outofrange'] = 'You are too far away from the delivery location to search the vehicle..', -- Notification
            ['vehiclemoving'] = 'You cant search a moving vehicle.. Pull over in the correct location..', -- Notification
            ['end'] = 'You found something whilst searching the vehicle!', -- Notification
            ['searching'] = 'Searching Vehicle...', -- Progressbar
        },
        Processing = {
            Menus = {
                Main = {
                    ['header'] = 'Chemistry Table', -- Menu header
                    ['text'] = 'Here you can process drugs!', -- Menu text
                    ['icon'] = 'fa-solid fa-flask-vial', -- Menu icon
                },
                Ketamine = {
                    ['header'] = 'Ketamine', -- Menu header
                    ['text'] = 'Required:</p>'..Config.Ketamine.Processing.Required['1'].amount..'x '..Config.Ketamine.Processing.Required['1'].label..'</p>'..Config.Ketamine.Processing.Required['2'].amount..'x '..Config.Ketamine.Processing.Required['2'].label..'</p>'..Config.Ketamine.Processing.Required['3'].amount..'x '..Config.Ketamine.Processing.Required['3'].label, -- Menu text
                    ['icon'] = 'fa-solid fa-vial', -- Menu icon
                }
            },
            ['wrongitems'] = 'You dont have the correct items required to process..', -- Notification
            ['busy'] = 'You are already processing..', -- Notification
            ['prep'] = 'Preparing Processing Materials..', -- Notification
            ['wait'] = 'Waiting For Processing..', -- Notification
            ['processxp'] = 'You processed some '..Config.Ketamine.Processing.Return.label..' and earned some xp!', -- Notification
            ['processnoxp'] = 'You processed some '..Config.Ketamine.Processing.Return.label..'!', -- Notification
        },
        Cutting = {
            ['nocutkit'] = 'You cant cut drugs without a '..Config.Ketamine.Cutting.Required['1'].label..'..', -- Notification
            ['noscales'] = 'You cant cut drugs without a set of '..Config.Ketamine.Cutting.Required['2'].label..'..', -- Notification
            ['enoughbags'] = 'You dont have enough '..Config.Ketamine.Cutting.Required['3'].label..'..', -- Notification
            ['nobags'] = 'You dont have any '..Config.Ketamine.Cutting.Required['3'].label..'..', -- Notification
            ['cutlowxp'] = 'You cut some drugs but you lost a little in the process due to your lack of experience!', -- Notification
            ['cutxp'] = 'You successfully cut some drugs and earned some xp!', -- Notification
            ['cutnoxp'] = 'You successfully cut some drugs!', -- Notification
            ['alreadycutting'] = 'You are already cutting drugs..', -- Notification
            ['cutdrugs'] = 'Cutting Drugs..', -- Progressbar
        },
        Take = {
            ['busy'] = 'You are already taking drugs..', -- Notification
            ['take'] = 'Sniffing Ketamine..', -- Progressbar
        }
    },
    Shared = {
        ['returnmenu'] = 'Return', -- Menu header
		['returnmenuicon'] = 'fa-solid fa-backward', -- Menu header icon
        ['exitmenu'] = 'Exit', -- Menu header
		['exitmenuicon'] = 'fa-solid fa-circle-xmark', -- Menu header icon
        ['cancelled'] = 'Action cancelled..', -- Notification
        ['noinvent'] = 'Looks like your pockets are full..', -- Notification
        ['outrange'] = 'Looks like you are too far away..' -- Notification  
    }
}