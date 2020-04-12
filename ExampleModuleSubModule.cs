using TaleWorlds.Core;
using TaleWorlds.Localization;
using TaleWorlds.MountAndBlade;

namespace ExampleModule
{
    public class ExampleModuleSubModule : MBSubModuleBase
    {
        protected override void OnSubModuleLoad()
        {
            InformationMessage message = new InformationMessage("Hello from ExampleModule!");

            InitialStateOption initStateOpt = new InitialStateOption(
                "ExampleModule",
                new TextObject("ExampleModule", null),
                9990,
                () => InformationManager.DisplayMessage(message),
                false
            );

            Module.CurrentModule.AddInitialStateOption(initStateOpt);
        }
    }
}
