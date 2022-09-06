using CatalogService as catalog from '../../srv/catalog-service';

annotate catalog.Encontros with @(UI : {
    Identification  : [{Value : titulo}],
    SelectionFields : [],
    LineItem        : [
        {Value : ID},
        {Value : titulo},
        {Value : data},
    ],
    HeaderInfo      : {
        TypeName       : '{i18n>titulo}',
        TypeNamePlural : '{i18n>titulos}',
        Title          : {Value : titulo},
        Description    : {Value : data}
    }
});

annotate catalog.Encontros with {
    ID     @title : '{i18n>ID}'  @UI.HiddenFilter;
    titulo @title : '{i18n>titulo}';
    resumo @title : '{i18n>resumo}';
    data   @title : '{i18n>data}';
};
