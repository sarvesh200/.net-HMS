using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class MenuWiseIngredient : System.Web.UI.Page
{
    UserManagement ff = new UserManagement();
    ArrayList data = new ArrayList();
    DataSet ds = new DataSet();
    int value = 0;
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
            
            ddlmenu.Items.Clear();
            ff.fillcombo1(ddlmenu, "select mname,menuid from menu");
        }
    }
    public void fillRepeater(int rows)
    {
        DataSet ds;
        try
        {
            ds = new DataSet();
            ds.Clear();
            ds.Tables.Add();
            ds.Tables[0].Columns.Add();
            ds.Tables[0].Columns[0].ColumnName = "ingredient ";
            ds.Tables[0].Columns.Add();
            ds.Tables[0].Columns[1].ColumnName = "quantity";
            ds.Tables[0].Columns.Add();
            ds.Tables[0].Columns[2].ColumnName = "units";
            for (int i = 0; i < rows; i++)
            {
                ds.Tables[0].Rows.Add();
            }
            rptdetails.DataSource = ds;
            rptdetails.DataBind();
            foreach(RepeaterItem itm in rptdetails.Items)
            {
                DropDownList ddlingre = (DropDownList)itm.FindControl("ddlingre");
                ddlingre.Items.Clear();
                ff.fillcombo(ddlingre, "select distinct(items) from stock");
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        dynamicPanel.Visible = false;        
        txtIngr.Text = "";

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (ff.CheckAllreadyExist("select menuid from menuwiseingredients where menuid='" + ddlmenu.SelectedItem.Text.Trim() + "'"))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('This Item Ingredient is Already exist... !')", true);
            }
            else
            {
                foreach (RepeaterItem itm in rptdetails.Items)
                {
                    DropDownList ddlingre = (DropDownList)itm.FindControl("ddlingre");
                    TextBox txtquantity = (TextBox)itm.FindControl("txtquantity");
                    DropDownList ddlunits = (DropDownList)itm.FindControl("ddlunits");

                    int max = ff.FetchMax("menuwiseingredients", "id");
                    data.Clear();
                    data.Add(max);
                    data.Add(ddlmenu.SelectedItem.Value.Trim());
                    data.Add(txtIngr.Text.Trim());
                    data.Add(ddlingre.SelectedItem.Text.Trim());
                    data.Add(txtquantity.Text.Trim()+" "+ ddlunits.SelectedItem.Text.Trim());


                    if (ff.Insertion("menuwiseingredients", data))
                    {
                        value = 1;
                    }
                    else
                    {
                        value = 0;
                    }

                }
            }
        }
        catch (Exception)
        {
            value = 0;

        }
        if (value == 1)
        {
            Response.Redirect("Success.aspx?msg=Activity Completed Successfully.&home=MenuWiseIngredient.aspx", false);
        }
        else if (value == 0)
        {
            Response.Redirect("Failure.aspx?err=Operation Failed&home=MenuWiseIngredient.aspx", false);
        }
    
    }

    protected void btngo_Click(object sender, EventArgs e)
    {
        try
        {
            fillRepeater(Convert.ToInt32(txtIngr.Text.Trim()));
            dynamicPanel.Visible = true;
        }
        catch (Exception)
        {

        }
    }
}