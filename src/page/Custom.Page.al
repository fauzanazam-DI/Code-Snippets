page 50000 Custom
{
    ApplicationArea = All;
    Caption = 'Custom';
    PageType = Card;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Ex: Codeunit "Extensions Mgt.";
                    JObject: JsonObject;
                    ObjectDictionary: Dictionary of [Text, text];
                begin
                    Ex.JsonObjectValuesToDictionary(JObject, ObjectDictionary);
                end;
            }
        }
    }
}
