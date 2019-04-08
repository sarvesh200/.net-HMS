using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class KitchenManager : System.Web.UI.Page
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
        if (Session["uid"].ToString() == "undefined" && Session["utyp"].ToString() != "kitchen")
        {
            Response.Redirect("Invalid.aspx", false);
        }
        if (!IsPostBack)
        {
           
            DDLMenuCat.Items.Clear();
            ff.fillcombo1(DDLMenuCat, "select ctg,ctgid from menucategory");
        }
        FillCategory();
    }
    protected void FillCategory()
    {

        try
        {
            ds = ff.FetchData("select * from menucategory");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (ff.CheckAllreadyExist("select * from menucategory where ctg='" + txtCategory.Text.Trim() + "'"))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Category is Already Exists...!')", true);

            }
            else
            {
                int max = ff.FetchMax("menucategory", "ctgid");
                data.Clear();
                data.Add(max);
                data.Add(txtCategory.Text.Trim());

                if (ff.Insertion("menucategory", data))
                {
                    Response.Redirect("KitchenManager.aspx", false);
                }
            }
            txtCategory.Text = "";
        }
        catch (Exception) { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        if (ff.CheckAllreadyExist("select menuid from menu where mname='" + txtMenu.Text.Trim() + "'"))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('This Item Already in Menu... !')", true);
        }
        else
        {
            data.Clear();
            int max = ff.FetchMax("menu", "menuid");
            data.Add(max);
            data.Add(DDLMenuCat.SelectedItem.Value);
            data.Add(DDLMenuCat.SelectedItem.Text.Trim());
            data.Add(txtMenu.Text.Trim());
            data.Add(txtPrice.Text.Trim());

            if (ff.Insertion("menu", data))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Activity is completed successfully..!')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Operation Failed..!')", true);
            }

        }
        txtMenu.Text = "";
        txtPrice.Text = "";
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("delete"))
            {
                string id = e.CommandArgument.ToString();
                if (ff.Execute("delete from menucategory where ctgid=" + id.Trim()))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Category deleted successfully... !')", true);
                    FillCategory();
                }
            }
            else
            if (e.CommandName.Equals("edit"))
            {
                string[] str = e.CommandArgument.ToString().Split('|');
                Label1.Text = str[0].ToString();
                txtctg.Text = str[1].ToString();
                MPE1.Show();
            }
        }
        catch (Exception)
        {

        }
    }
   

    protected void Btnctg_Click(object sender, EventArgs e)
    {
        try
        {
            string id = Label1.Text.Trim();
            if (ff.Execute("update menucategory set ctg='" + txtctg.Text.Trim() + "' where ctgid=" + id.Trim()))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Category name updated successfully... !')", true);
                FillCategory();
            }
        }
        catch (Exception)
        {

        }
    }
}