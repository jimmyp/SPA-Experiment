using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AU.SPA.Webforms.Page2
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var template = File.ReadAllText(Server.MapPath("~/Page2/Page2Content.html"));
            var data = new Dictionary<string, string>()
                           {
                                {"body", "This is my first post!"},
                                {"next" , "Page2"},
                                {"title", "My New Post"},
                                {"extraContent", "Some more content baby"}
                           };

            foreach (var variable in data)
            {
                template = template.Replace("{{" + variable.Key + "}}", variable.Value);
            }

            MainLabel.Text = template;
        }
    }
}