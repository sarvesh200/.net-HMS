using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
public partial class OrderDetailsReport : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    UserManagement ff = new UserManagement();
    public int count = 1;
    public string nm = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            ddlmon.Items.Clear();
            ff.fillmonthCombo(ddlmon);
            ddlyr.Items.Clear();
            ff.fillyearCombo(ddlyr);
        }
        
    }

    protected void FillBill()
    {
        try
        {
            DataSet dsdt = ff.FetchData("select distinct(orderId),userNm,totalBill,sts from Orders where mont = '" + ddlmon.SelectedItem.Value.Trim()+"' and yr = '"+ddlyr.SelectedItem.Text.Trim()+"' and sts = 'paid'");
            if (dsdt.Tables[0].Rows.Count > 0)
            {
                rptbill.DataSource = dsdt;
                rptbill.DataBind();
               
               
                foreach (DataListItem itm in rptbill.Items)
                {
                    Label lblid = (Label)itm.FindControl("lblid");
                    Repeater rpttotal = (Repeater)itm.FindControl("rpttotal");

                    DataSet dsbill = ff.FetchData("select * from OrderDetails where orderId='" + lblid.Text.Trim() + "'");
                    if (dsbill.Tables[0].Rows.Count > 0)
                    {
                        rpttotal.DataSource = dsbill;
                        rpttotal.DataBind();
                        count++;
                    }
                    else
                        count = 0;
                   
                }
            }
            else
                count = 0;
        }
        catch (Exception ex)
        {
            count = 0;
        }
    }
    protected void Btngo_Click(object sender, EventArgs e)
    {
        FillBill();
    }
}