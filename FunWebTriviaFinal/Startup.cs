using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FunWebTriviaFinal.Startup))]
namespace FunWebTriviaFinal
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
