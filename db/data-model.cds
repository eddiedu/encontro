namespace encontro.db;

using {
  managed,
  sap.common
} from '@sap/cds/common';

entity Encontros : managed {
  key ID     : UUID @(Core.Computed : true);
      titulo : String(100);
      resumo : String;
      data   : Date;
};
