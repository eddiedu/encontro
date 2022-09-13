using {encontro.db as db} from '../db/data-model';

service CatalogService @(path : '/catalog') @(requires : 'authenticated-user') {
    @odata.draft.enabled
    entity Encontros @(restrict : [
        {
            grant : ['READ'],
            to    : 'Viewer'
        },
        {
            grant : ['WRITE'],
            to    : 'Admin'
        }
    ]) as select * from db.Encontros;

    type userScopes {
        identified    : Boolean;
        authenticated : Boolean;
        Viewer        : Boolean;
        Admin         : Boolean;
    };

    type userType {
        user   : String;
        locale : String;
        scopes : userScopes;
    };

    function userInfo() returns userType;


};
