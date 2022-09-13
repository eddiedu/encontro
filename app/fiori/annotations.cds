using CatalogService as catalog from '../../srv/catalog-service';

annotate catalog.Encontros with @(UI : {
    Identification   : [{Value : titulo}],
    SelectionFields  : [],
    LineItem         : [
        {Value : ID},
        {Value : titulo},
        {Value : data},
        {
            Value       : priotiry.name,
            Criticality : priotiry_code
        },

    ],
    HeaderInfo       : {
        TypeName       : '{i18n>titulo}',
        TypeNamePlural : '{i18n>titulos}',
        Title          : {Value : titulo},
        Description    : {Value : data}
    },
    Facets           : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Main',
            Target : '@UI.FieldGroup#Main'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Todos',
            Target : 'todos/@UI.LineItem'
        },
    ],
    FieldGroup #Main : {Data : [
        {Value : resumo},
        {Value : titulo},
        {Value : priotiry_code}
    ]}
}, );


annotate catalog.Todos with @(UI : {LineItem : [
    {Value : completado},
    {Value : text},
]}, );

annotate catalog.Encontros with {
    resumo @title : 'Resumo';
    titulo @title : 'Título';
    priotiry @title : 'Pioridade';
}
