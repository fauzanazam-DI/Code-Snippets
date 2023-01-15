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
        area(Promoted)
        {
            group(SplitButton)
            {
                ShowAs = SplitButton;

                actionref(ActionName1; ActionName) { }
            }
        }

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