namespace encontro.db;

using {
    managed,
    cuid,
    sap.common
} from '@sap/cds/common';

entity Encontros : managed {
    key ID     : UUID @(Core.Computed : true);
        titulo : String(100);
        resumo : String;
        data   : Date;
        priotiry : Association to Priority;

        todos: Composition of many Todos on todos.encontro = $self;
};

entity Todos : cuid, managed {
    text : String(100);
    completado : Boolean;
    encontro : Association to Encontros;
}

entity Priority : common.CodeList {
    key code : Integer;
}