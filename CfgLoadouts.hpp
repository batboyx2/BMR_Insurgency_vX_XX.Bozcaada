class CfgLoadouts {
    #define MEDICAL_MODE_BASIC 1
    #define MEDICAL_MODE_ADVANCED 2
    MEDICAL_MODE = MEDICAL_MODE_BASIC;
    class MEDICAL_BASIC {
        class STANDARD {
            items[] = {"ACE_fieldDressing:3","ACE_morphine"};
        };
        class LEADER {
            items[] = {"ACE_fieldDressing:4","ACE_morphine"};
        };
        class MEDIC {
            items[] = {"ACE_fieldDressing:31","ACE_epinephrine:8","ACE_bloodIV:2","ACE_morphine:14"};
        };
        class VEHICLE {
            items[] = {"ACE_fieldDressing:12","ACE_morphine:4"};
        };
    };
    class MEDICAL_ADVANCED {
        class STANDARD {
            items[] = {"ACE_fieldDressing:3","ACE_elasticBandage:3","ACE_packingBandage:3","ACE_quikclot:3","ACE_morphine","ACE_epinephrine","ACE_tourniquet"};
        };
        class LEADER {
            items[] = {"ACE_fieldDressing:4","ACE_elasticBandage:4","ACE_packingBandage:4","ACE_quikclot:4","ACE_morphine","ACE_epinephrine","ACE_tourniquet"};
        };
        class MEDIC {
            items[] = {"ACE_fieldDressing:15","ACE_elasticBandage:20","ACE_packingBandage:20","ACE_quikclot:15","ACE_atropine:12","ACE_morphine:8","ACE_epinephrine:8","ACE_tourniquet:5","ACE_salineIV_500:6"};
        };
        class VEHICLE: MEDIC {};
    };
    #include "Loadouts\bluefor_standard.hpp"
};
