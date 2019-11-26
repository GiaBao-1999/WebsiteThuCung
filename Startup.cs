using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Petshop.Startup))]
namespace Petshop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
