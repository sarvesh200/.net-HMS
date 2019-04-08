using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Admin : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    UserManagement ff = new UserManagement();
    public int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["uid"].ToString() == "undefined" && Session["utyp"].ToString() != "Admin")
        {
            Response.Redirect("Invalid.aspx", false);
        }

        if(!IsPostBack)
        FillData();
    }
    protected void FillData()
    {
        try
        {
            ds = ff.FetchData("select * from menu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                count++;
            }
            else
                count = 0;
        }
        catch (Exception)
        {
            count = 0;
        }
    }



}