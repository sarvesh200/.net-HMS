using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class CookingManager : System.Web.UI.Page
{
    UserManagement ff = new UserManagement();
    ArrayList data = new ArrayList();
    DataSet ds = new DataSet();
    int value = 0;
    public int count = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["uid"].ToString() == "undefined" && Session["utyp"].ToString() != "Cook")
        {
            Response.Redirect("Invalid.aspx", false);
        }
        
    }
    protected void txtquantity_TextChanged(object sender, EventArgs e)
    {
        try
        {
            foreach (RepeaterItem itm in Repeater1.Items)
            {
                TextBox txtquantity = (TextBox)itm.FindControl("txtquantity");
                Label lblprice = (Label)itm.FindControl("lblprice");
                TextBox txtPrice = (TextBox)itm.FindControl("txtPrice");
                CheckBox chk = (CheckBox)itm.FindControl("cbRows");
                if (chk.Checked == true)
                {
                    int a= Convert.ToInt32(txtquantity.Text);
                    int b = Convert.ToInt32(lblprice.Text);

                    txtPrice.Text = (a * b).ToString();
                }
            }
        }
        catch (Exception)
        {

        }
    }
    protected void FillMenu()
    {
       
        try
        {
            ds = new DataSet();
            
            ds = ff.FetchData("select distinct(mname),menuid,price from menu;");
            if (ds.Tables[0].Rows.Count > 0)
            {
                pnl.Visible = true;
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            ArrayList malst = new ArrayList();
            ArrayList pralst = new ArrayList();
            ArrayList midalst = new ArrayList();
            ArrayList qualst = new ArrayList();
            int omax = 0;

            foreach (RepeaterItem itm in Repeater1.Items)
            {
                TextBox txtquantity = (TextBox)itm.FindControl("txtquantity");
                Label lblprice = (Label)itm.FindControl("lblprice");
                TextBox txtPrice = (TextBox)itm.FindControl("txtPrice");
                Label lblmenu = (Label)itm.FindControl("lblmenu");
                Label lblmid = (Label)itm.FindControl("lblmid");
                CheckBox chk = (CheckBox)itm.FindControl("cbRows");

                if (chk.Checked == true)
                {                   
                    malst.Add(lblmenu.Text);
                    pralst.Add(txtPrice.Text);
                    qualst.Add(txtquantity.Text);
                    midalst.Add(lblmid.Text);
                }
            }
            string mnm = "";
            int pr = 0;
            for (int s = 0; s < malst.Count; s++)
            {
                mnm +=  malst[s].ToString();
                if (malst.Count - 1 > s)
                {
                    mnm += ",";
                }
            }
            for (int s1 = 0; s1 < pralst.Count; s1++)
            {
                pr += Convert.ToInt32(pralst[s1]);                
            }

            data.Clear();
            omax = ff.FetchMax("Orders", "orderId");
            data.Add(omax);
            data.Add(txtcustnm.Text.Trim());
            data.Add(mnm.Trim());
            data.Add(pr);
            data.Add(DateTime.Now.Day.ToString("00"));
           data.Add(DateTime.Now.Month.ToString("00"));
            data.Add(DateTime.Now.Year);
           data.Add("By Cash");
            data.Add("pending");
            data.Add(txtaddress.Text.Trim());
            data.Add(txtmob.Text.Trim());

            if (ff.Insertion("Orders", data))
            {
                for (int j = 0; j < malst.Count; j++)
                {
                    int maxid1 = ff.FetchMax("OrderDetails", "detailsId");
                                        
                    data.Clear();
                    data.Add(maxid1);
                    data.Add(omax);
                    data.Add(midalst[j]);
                    data.Add(malst[j]);
                    data.Add(qualst[j]);
                    data.Add(pralst[j]);
                    data.Add(DateTime.Now.Day.ToString("00"));
                    data.Add(DateTime.Now.Month.ToString("00"));
                    data.Add(DateTime.Now.Year);

                    if (ff.Insertion("OrderDetails", data))
                    {
                        DataSet dss = ff.FetchData("select ingredient,quantity from menuwiseingredients where menuid=" + midalst[j] + "");
                        for (int k = 0; k < dss.Tables[0].Rows.Count; k++)
                        {
                            data.Clear();
                            int id = ff.FetchMax("Orderingredients", "id");
                            data.Add(id);
                            data.Add(omax);
                            data.Add(maxid1);
                            data.Add(midalst[j]);
                            data.Add(dss.Tables[0].Rows[k]["ingredient"].ToString());
                            data.Add(dss.Tables[0].Rows[k]["quantity"].ToString());
                            data.Add(DateTime.Now.Day.ToString("00"));
                            data.Add(DateTime.Now.Month.ToString("00"));
                            data.Add(DateTime.Now.Year);

                            if (ff.Insertion("Orderingredients", data))
                            {
                                value = 1;

                            }
                        }
                    }
                }
            }
            else
            {
                value = 0;

            }
            
        }
        catch (Exception)
        {
            value = 0;
        }
        if (value == 1)
        {
            pnl.Visible = false;
            txtaddress.Text = "";
            txtcustnm.Text = "";
            txtmob.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Activity is completed successfully..!')", true);
        }
        else if (value == 0)
        {
            pnl.Visible = false;
            txtaddress.Text = "";
            txtcustnm.Text = "";
            txtmob.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Operation Failed..!')", true);
        }
    }

    protected void btngo_Click(object sender, EventArgs e)
    {
        FillMenu();
    }

    protected void btncan_Click(object sender, EventArgs e)
    {
        pnl.Visible = false;
        txtaddress.Text = "";
        txtcustnm.Text = "";
        txtmob.Text = "";
    }
}