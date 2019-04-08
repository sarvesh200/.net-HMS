using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class StockManager : System.Web.UI.Page
{
    public string uid, utyp, unm;
    UserManagement ff = new UserManagement();
    ArrayList data = new ArrayList();
    DataSet ds = new DataSet();
    public int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["uid"].ToString() == "undefined" && Session["utyp"].ToString() != "stock")
        {
            Response.Redirect("Invalid.aspx", false);
        }
       // if (!IsPostBack)
            FillData();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        DataSet dst = ff.FetchData("select id from stock where items='" + txtitem.Text.Trim() + "'");
        if(dst.Tables[0].Rows.Count>0)
        {
            
            string units = "";
            double qty = 0, ingqty = 0;
            qty = Convert.ToDouble(txtquantity.Text.Trim());
            units = ddlunits.SelectedItem.Text;

            if (units.Equals("gram"))
            {
                ingqty = qty;
                units = "gram";
            }
            else if (units.Equals("kg"))
            {
                ingqty = qty * 1000;
                units = "gram";
            }
            else if (units.Equals("quintal"))
            {
                ingqty = qty * 100000;
                units = "gram";

            }
            else if (units.Equals("tones"))
            {

                ingqty = qty * 1000000;
                units = "gram";
            }
            else if (units.Equals("liter"))
            {
                ingqty = qty * 1000;
                units = "mililiter";
            }
            string quanty = Convert.ToString(ingqty) + " " + units;

            if(ff.Execute("update stock set items='"+txtitem.Text.Trim()+ "',quantity='" + txtquantity.Text.Trim()+ "',ingramquanity='" + quanty.Trim()+"',price="+txtPrice.Text.Trim()+" where id="+dst.Tables[0].Rows[0]["id"].ToString()+" "))
            { ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Activity is completed successfully..!')", true); }
        }
        else
        {
        
            string units = "", quanty="";
            double qty=0,ingqty=0;
            qty = Convert.ToDouble(txtquantity.Text.Trim());
            units = ddlunits.SelectedItem.Text;

            if (units.Equals("gram"))
            {
                ingqty = qty;
                units = "gram";
            }
            else if (units.Equals("kg"))
            {
                ingqty = qty * 1000;
                units = "gram";
            }
            else if (units.Equals("quintal"))
            {
                ingqty = qty * 100000;
                units = "gram";

            }
            else if (units.Equals("tones"))
            {

                ingqty = qty * 1000000;
                units = "gram";
            }         
         else if (units.Equals("liter"))
            {
                ingqty = qty * 1000;
                units = "mililiter";
            }
         quanty = Convert.ToString(ingqty) + " " + units;

            data.Clear();
            int max = ff.FetchMax("stock", "id");
            data.Add(max);
            data.Add(txtitem.Text.Trim());
            data.Add(txtquantity.Text.Trim() + " " + units);
            data.Add(quanty.Trim());
            data.Add(txtPrice.Text.Trim());

            if (ff.Insertion("stock", data))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Activity is completed successfully..!')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Operation Failed..!')", true);
            }

        }
        txtitem.Text = "";
        txtPrice.Text = "";
        txtquantity.Text = "";
        FillData();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("delete"))
            {
                string id = e.CommandArgument.ToString();
                if (ff.Execute("delete from stock where id=" + id.Trim()))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Stock deleted successfully... !')", true);
                    FillData();
                }
            }
            else
            if (e.CommandName.Equals("edit"))
            {
                string[] str = e.CommandArgument.ToString().Split('|');
                Label1.Text = str[0].ToString();
                txtitmnm.Text = str[1].ToString();
                string[] str1 = str[2].ToString().Split(' ');
                txtqua.Text = str1[0].ToString();
                ddluni.SelectedItem.Text = str1[1].ToString();
                txtpri.Text = str[3].ToString();
                MPE1.Show();
            }
        }
        catch (Exception)
        {

        }
    }
    protected void FillData()
    {

        try
        {
            ds = ff.FetchData("select * from stock");
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
    protected void Btnctg_Click(object sender, EventArgs e)
    {
        try
        {
            string id = Label1.Text.Trim();
            string units = "", quanty = "";
            double qty = 0, ingqty = 0;
            qty = Convert.ToDouble(txtqua.Text.Trim());
            units = ddluni.SelectedItem.Text.Trim();

            if (units.Equals("gram"))
            {
                ingqty = qty;
                units = "gram";
            }
            else if (units.Equals("kg"))
            {
                ingqty = qty * 1000;
                units = "gram";
            }
            else if (units.Equals("quintal"))
            {
                ingqty = qty * 100000;
                units = "gram";

            }
            else if (units.Equals("tones"))
            {

                ingqty = qty * 1000000;
                units = "gram";
            }
            else if (units.Equals("liter"))
            {
                ingqty = qty * 1000;
                units = "mililiter";
            }
            quanty = Convert.ToString(ingqty) + " " + units;
            if (ff.Execute("update stock set items='" + txtitmnm.Text.Trim() + "',quantity='" + txtqua.Text.Trim()+" "+ units.Trim() + "',ingramquanity='" + quanty.Trim() + "',price=" + txtpri.Text.Trim()+" where id=" + id.Trim()))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Stock updated successfully... !')", true);
                FillData();
            }
        }
        catch (Exception)
        {

        }
    }
}