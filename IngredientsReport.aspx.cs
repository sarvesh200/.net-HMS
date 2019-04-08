using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class IngredientsReport : System.Web.UI.Page
{
   
    UserManagement ff = new UserManagement();
    public int count = 0,count1=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["uid"].ToString() == "undefined")
        {
            Response.Redirect("Invalid.aspx", false);
        }

        if (!IsPostBack)
            FillData();
    }
    protected void FillData()
    {
        try
        {
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();

            ds = ff.FetchData("select * from menu;");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dtlstreport.DataSource = ds;
                dtlstreport.DataBind();
                foreach (DataListItem itm in dtlstreport.Items)
                {
                    Label lblid = (Label)itm.FindControl("lblid");
                    ds1 = ff.FetchData("select * from menuwiseingredients where menuid="+lblid.Text.Trim()+";");

                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        Repeater rep = (Repeater)itm.FindControl("Repeater1");

                        rep.DataSource = ds1;
                        rep.DataBind();
                        count++;
                        count1++;
                    }
                    
                }
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