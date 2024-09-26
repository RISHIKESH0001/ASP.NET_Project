using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class index : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies[Session.SessionID] != null)
            {
                HttpCookie myCookie = new HttpCookie(Session.SessionID);
                myCookie.Expires = DateTime.Now.AddDays(-1); // Set expiration date in the past
                Response.Cookies.Add(myCookie);
            }
            if (Session["UserId"] != null)
            {
                Log_In.Visible = false;
            }
        }

        protected void Log_In_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

    }
}