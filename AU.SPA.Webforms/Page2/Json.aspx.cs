using System;
using System.Web.UI;

namespace AU.SPA.Webforms.Page2
{
    public partial class Json : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(@"{ 
                                ""title"": ""My New Post"", 
                                ""body\"": ""This is my first post!"",
                                ""extraContent"": ""Some more content baby"",
                                ""next"" : ""Page2""
                            }");
            Response.ContentType = "application/json";

        }
    }
}