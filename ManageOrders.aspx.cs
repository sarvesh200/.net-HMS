using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
public partial class ManageOrders : System.Web.UI.Page
{
    UserManagement ff = new UserManagement();
    ArrayList data = new ArrayList();
    DataSet ds = new DataSet();
    int value = 0;
    public int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["uid"].ToString() == "undefined" && Session["utyp"].ToString() != "Cook")
        {
            Response.Redirect("Invalid.aspx", false);
        }
      
            FillData();
    }
    protected void FillData()
    {
        try
        {
            ds = ff.FetchData("select distinct(a.userNm),a.*,b.noofdish,b.mname,b.totalPrice,b.menuid from Orders a inner join OrderDetails b on a.orderId = b.orderId where a.sts = 'pending' and a.mont='" + DateTime.Now.Month + "' and a.yr='" + DateTime.Now.Year + "'"); 

           // ds = ff.FetchData("select * from OrderDetails where mont='"+DateTime.Now.Month+"' and yr='"+DateTime.Now.Year+"'");
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

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            Label1.Text = "";
            txtdishcook.Text = "";
            txtremains.Text = "";
            txtnoofdish.Text = "";
            string[] str = e.CommandArgument.ToString().Trim().Split('|');
            Label1.Text = str[0];
            Label2.Text = str[1];
            txtnoofdish.Text = str[2];
            MPE1.Show();
        }
        catch (Exception)
        {

        }
    }

    protected void txtdishcook_TextChanged(object sender, EventArgs e)
    {
        try
        {
            int n, m, j;
            n = Convert.ToInt32(txtnoofdish.Text.Trim());
            m = Convert.ToInt32(txtdishcook.Text.Trim());
            txtremains.Text = (n - m).ToString();
            MPE1.Show();
        }
        catch (Exception)
        {

        }
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        try
        {
            data.Clear();
            int max = ff.FetchMax("ManageOrders", "id");
            data.Add(max);
            data.Add(Label1.Text.Trim());
            data.Add(txtnoofdish.Text.Trim());
            data.Add(txtremains.Text.Trim());
            data.Add(txtdishcook.Text.Trim());
            data.Add(DateTime.Now.Day.ToString("00"));
            data.Add(DateTime.Now.Month.ToString("00"));
            data.Add(DateTime.Now.Year);

            if (ff.Insertion("ManageOrders", data))
            {
                DataSet dsitms = new DataSet();
                DataSet dsstk = new DataSet();

                dsitms = ff.FetchData("select ingredient,quantity  from Orderingredients where orderId='" + Label1.Text.Trim() + "' and menuid='"+Label2.Text+"'");
                for (int i = 0; i < dsitms.Tables[0].Rows.Count; i++)
                {
                    dsstk = ff.FetchData("select * from stock where items='" + dsitms.Tables[0].Rows[i]["ingredient"].ToString().Trim() + "'");
                    string[] str = dsitms.Tables[0].Rows[i]["quantity"].ToString().Split(' ');

                    string[] str1 = dsstk.Tables[0].Rows[0]["ingramquanity"].ToString().Split(' ');
                    string[] strun = dsstk.Tables[0].Rows[0]["quantity"].ToString().Split(' ');

                    int val1 = Convert.ToInt32(str[0]);
                    int val2 = Convert.ToInt32(str1[0]);
                    int res =(val2-(val1* Convert.ToInt32(txtnoofdish.Text.Trim())));
                    string ingrm = res + " " + str1[1];

                    string units = strun[1].ToString();
                    int qunty = 0; string orgqu = "";
                    if (units.Equals("gram"))
                    {
                        qunty = res;
                        units = "gram";
                    }
                    else if (units.Equals("kg"))
                    {
                        qunty = res / 1000;
                        units = "kg";
                    }
                    else if (units.Equals("quintal"))
                    {
                        qunty = res / 100000;
                        units = "quintal";

                    }
                    else if (units.Equals("tones"))
                    {

                        qunty = res / 1000000;
                        units = "tones";
                    }
                    else if (units.Equals("liter"))
                    {
                        qunty = res / 1000;
                        units = "liter";
                    }
                    orgqu = qunty.ToString() + " " + units;
                    if (ff.Execute("update stock set quantity='" + orgqu.Trim() + "',ingramquanity='" + ingrm.Trim() + "' where id=" + dsstk.Tables[0].Rows[0]["id"].ToString() + " "))
                    {
                        value = 1;
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
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Activity is completed successfully..!')", true);
        }
        else if (value == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Operation Failed..!')", true);
        }
    }
}