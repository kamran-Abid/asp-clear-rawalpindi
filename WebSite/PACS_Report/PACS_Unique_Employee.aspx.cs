using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PACS_Report_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings['vmsconnectionstring'].ConnectionString;
        SqlConnection con = new SqlConnection("Data Source = Mctx-Zafeer\\SQLEXPRESS; Initial Catalog=NLC_DB-16-07-2022;User ID=sa;Password=sa@1234");
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT ROW_NUMBER() OVER (ORDER BY(SELECT minTimeIn)) AS SR#, * FROM ( "
             + "SELECT isnull(FirstName, '') + ' ' + isnull(LastName, '') as Name, Nic as CNIC, "
             + "ServiceNo as HRNo#, dep.Department_Name as Department, deg.designation as Appointment, rk.Rank_Name as Rank, "
             + "  gt.Gate_Name as Gate,  "
             + "  (CASE WHEN(mvl.User_Type = 'mctx_VACS') THEN vac.VehicleNo ELSE '' END) as VehicleNo,"
             + "  (CASE WHEN(mvl.User_Type = 'mctx_VACS') THEN vac.VehicleType  ELSE '' END ) as VehicleType, " 
             + " CONVERT(VARCHAR, MIN(mvl.TIME_IN), 13) AS minTimeIn, CONVERT(VARCHAR, CONVERT(DATETIME, MAX(mvl.TIME_OUT), 20), 13) AS maxTimeOut, mvl.Remarks AS Remarks "
             + "FROM mctx_visitorlog mvl "
             + "    LEFT JOIN dbo.Employee emp ON Convert(varchar(max), Convert(Decimal, emp.NIC)) = mvl.CNIC "
             + "    LEFT JOIN dbo.mctx_VACS vac ON vac.VehicleNo = mvl.VEHICLE_NUMBER "
             + "    LEFT JOIN dbo.mctx_Department dep ON dep.Department_ID = emp.Department "
             + "    LEFT JOIN dbo.HR_Designation deg ON deg.Designation_ID = emp.Designation "
             + "    LEFT JOIN dbo.mctx_Ranks rk ON rk.Rank_ID = emp.[Rank] "
             + "    LEFT JOIN dbo.mctx_Gates gt ON gt.Gate_ID = mvl.GATE_NUMBER "
             + "    LEFT JOIN dbo.mctx_Wiegand_Devices wd ON wd.ID = mvl.TerminalID "
             // + " WHERE DATE  >= '2022-08-20' AND Nic IS NOT NULL "
              + " Where DATE='" + DateTime.Now.ToString("yyyy-MM-dd") + "' " 
              + "GROUP BY Nic, FirstName, LastName, DATE, ServiceNo, dep.Department_Name, deg.designation, rk.Rank_Name, gt.Gate_Name, "
             + "mvl.Remarks, mvl.User_Type, vac.VehicleNo, vac.VehicleType ) subTable "
             + "GROUP BY CNIC, Name, minTimeIn, maxTimeOut, HRNo#, Department, Appointment, Rank, Gate, VehicleNo, VehicleType, Remarks "
             + "ORDER BY minTimeIn", con);
        SqlDataReader rdr = cmd.ExecuteReader();
        GVdetails1.DataSource = rdr;
        GVdetails1.DataBind();
        con.Close(); // d:\mctx zafeer\nlc - rawalpindi\nlc - v5 - 05 - 12 - 2022\WebSite.cs
    }
}