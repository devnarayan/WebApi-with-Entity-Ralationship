using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Webservice.Web.Startup))]
namespace Webservice.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
