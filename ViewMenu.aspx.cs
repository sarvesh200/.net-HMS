using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMenu : System.Web.UI.Page
{
    public string uid, utyp, unm,qr;
    UserManagement ff = new UserManagement();
    ArrayList data = new ArrayList();
    ArrayList cols = new ArrayList();
    int max = 0;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
       

        if (!IsPostBack)
        {
            gvbind();
        }

        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }


    protected void gvbind()
    {
        ds = ff.FetchData("select * from menu");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        qr = "delete FROM menu where menuid=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        ff.Execute(qr);
        gvbind();


    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        gvbind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");

        TextBox cnm = (TextBox)row.Cells[1].Controls[0];
        TextBox cat = (TextBox)row.Cells[2].Controls[0];
        TextBox pr = (TextBox)row.Cells[3].Controls[0];
        GridView1.EditIndex = -1;
        qr = "update menu set mname='" + cnm.Text.Trim() + "', ctg='" + cat.Text.Trim() + "',price=" + pr.Text.Trim() + " where menuid=" + id;
        ff.Execute(qr);

        gvbind();

        //GridView1.DataBind();

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        gvbind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        gvbind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
        {
            string id = e.Row.Cells[0].Text; // Get the id to be deleted
            LinkButton lb = (LinkButton)e.Row.Cells[4].Controls[2]; //cast the ShowDeleteButton link to linkbutton
            if (lb != null)
            {
                lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');"); //attach the JavaScript function with the ID as the paramter
            }
        }
    }
}
