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

namespace HetalDemo
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employees.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(calDOJ.SelectedDate == DateTime.MinValue)
            {
                valDOJ.Text = "Please select the DOJ";
                valDOJ.Visible = true;
                return;
            }

            var cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SaveEmployee", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtName.Text;
                    cmd.Parameters.Add("@DepartmentId", SqlDbType.VarChar).Value = ddlDept.SelectedValue;
                    cmd.Parameters.Add("@Designation", SqlDbType.VarChar).Value = txtDesignation.Text;
                    cmd.Parameters.Add("@BasicSalary", SqlDbType.VarChar).Value = txtBasicSalary.Text;
                    cmd.Parameters.Add("@DOJ", SqlDbType.DateTime).Value = calDOJ.SelectedDate;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            Response.Redirect("Employees.aspx");
        }
    }
}