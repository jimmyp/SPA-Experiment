using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AU.SPA.Webforms.Page1
{
    public partial class Json : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("{ \"title\": \"My New Post\", \"body\": \"This is my first post!\" }");
            Response.ContentType = "application/json";

        }
    }
}