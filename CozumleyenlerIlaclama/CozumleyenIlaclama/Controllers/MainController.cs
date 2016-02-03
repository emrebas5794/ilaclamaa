using CozumleyenIlaclama.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using System.Text;
using System.Drawing;
using CozumleyenIlaclama.Filter;

namespace CozumleyenIlaclama.Controllers
{
    [AuthorizeFilter]
    public class MainController : Controller
    {
        DbConfiguration configuration = new DbConfiguration();
        // GET: Main
        [AllowAnonymous]
        public ActionResult Login(string KullaniciAdi, string Sifre)
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public string logincontrol(string KullaniciAdi, string Sifre)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string Query = "SELECT Id FROM Employee WHERE Email=@KullaniciAdi AND Sifre=@Sifre";
            SqlCommand com = new SqlCommand(Query, con);
            com.Parameters.AddWithValue("KullaniciAdi", KullaniciAdi);
            com.Parameters.AddWithValue("Sifre", Sifre);

            SqlDataReader reader = com.ExecuteReader();
            JObject jo = new JObject();
            if (reader.Read() && (int)reader[0] > 0)
            {
                //giriş yaptı
                Session["Email"] = KullaniciAdi;
                Session["IPAddress"] = Request.UserHostAddress;
                Session["LastActivity"] = DateTime.Now;
                Session.Timeout = 45;
                Session["TimeOut"] = Session.Timeout;
                Session["EmployeeId"] = reader["Id"].ToString();
                jo.Add("Id", reader["Id"].ToString());
            }
            reader.Close();
            con.Close();
            return jo.ToString();
        }

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Personel()
        {
            return View();
        }

        public ActionResult Customers()
        {
            return View();
        }

        public ActionResult Employee(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string Query = "SELECT * FROM Employee WHERE Id = @Id";
            SqlCommand com = new SqlCommand(Query, con);
            com.Parameters.AddWithValue("Id", Id);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            ViewBag.EA = JsonConvert.SerializeObject(JA);
            return View();
        }

        public ActionResult Customer(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string Query = "SELECT * FROM Customer WHERE Id = @Id";
            SqlCommand com = new SqlCommand(Query, con);
            com.Parameters.AddWithValue("Id", Id);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            ViewBag.SA = JsonConvert.SerializeObject(JA);
            return View();
        }

        public ActionResult EmployeeSettings()
        {
            return View();
        }

        public ActionResult CustomerSettings()
        {
            return View();
        }

        public ActionResult Employees()
        {
            return View();
        }

        public ActionResult Services()
        {
            return View();
        }

        public ActionResult ServiceSettings()
        {
            return View();
        }

        public ActionResult StationSettings()
        {
            return View();
        }

        public ActionResult ServicesCalender()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string Query = "SELECT * FROM Service ; SELECT * FROM ServiceContract_View";
            SqlCommand com = new SqlCommand(Query, con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            Dictionary<int, string> arr = new Dictionary<int, string>();
            while (reader.Read())
            {
                arr.Add(int.Parse(reader["Id"].ToString()), reader["HizmetAdi"].ToString());

            }
            reader.NextResult();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    Debug.Print(reader["Tarih"].ToString());
                    if (reader.GetName(i) == "HizmetTipi")
                    {
                        StringBuilder hizmetler = new StringBuilder();
                        string[] ids = reader[i].ToString().Split(',');
                        for (int j = 0; j < ids.Length; j++)
                        {
                            ids[j] = arr[int.Parse(ids[j])];
                        }
                        JO.Add("HizmetTipAdi", string.Join(",", ids));
                    }
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            ViewBag.Data = JsonConvert.SerializeObject(JA);
            return View();
        }

        [HttpPost]
        public string Services_GET()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Service_View", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        [HttpPost]
        public string Station_GET()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Station", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        [HttpPost]
        public void Station_SET()
        {
            string ad = Request["Ad"];
            string tur = Request["Tur"];
            string aciklama = Request["Aciklama"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO Station (Ad, Tur, Aciklama) VALUES (@Ad, @Tur, @Aciklama)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("Ad", ad);
            com.Parameters.AddWithValue("Tur", tur);
            com.Parameters.AddWithValue("Aciklama", aciklama);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public string StationOne(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Station WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        [HttpPost]
        public void Station_UPDATE()
        {
            int id = int.Parse(Request["Id"]);
            string ad = Request["Ad"];
            string tur = Request["Tur"];
            string aciklama = Request["Aciklama"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Station SET Ad = @Ad, Tur=@Tur, Aciklama=@Aciklama WHERE Id= @Id";
            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Ad", ad);
            com.Parameters.AddWithValue("Tur", tur);
            com.Parameters.AddWithValue("Aciklama", aciklama);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        [HttpPost]
        public void Station_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM Station WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        [HttpPost]
        public string Service_GET(int HizmetGrupId)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Service WHERE HizmetGrupId = @HizmetGrupId ", con);
            com.Parameters.AddWithValue("HizmetGrupId", HizmetGrupId);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void Service_SET()
        {
            string hizmet = Request["HizmetAdi"];
            string servicegroup = Request["HizmetGrupId"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO Service (Bind, HizmetAdi, HizmetGrupId) VALUES (NEWID(), @HizmetAdi, @HizmetGrupId)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("HizmetGrupId", servicegroup);
            com.Parameters.AddWithValue("HizmetAdi", hizmet);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Service_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com2 = new SqlCommand("SELECT Id,HizmetId FROM Customer WHERE HizmetId  like '%" + Id + "%' ", con);
            con.Open();
            SqlDataReader reader2 = com2.ExecuteReader();
            string query = "";
            while (reader2.Read())
            {
                string CId = reader2["Id"].ToString();
                string[] CHizmet = (reader2["HizmetId"].ToString()).Split(',');
                List<string> s = new List<string>();
                for (int j = 0; j < CHizmet.Length; j++)
                {
                    if (CHizmet[j] != Id.ToString())
                    {
                        s.Add(CHizmet[j]);
                    }
                }
                string deger = string.Join(",", s.ToArray());
                query += "UPDATE Customer SET HizmetId='" + deger + "' WHERE Id='" + CId + "' ;";
            }
            reader2.Close();

            SqlCommand com4 = new SqlCommand("SELECT Id,HizmetTipi FROM ExtraServiceContract WHERE HizmetTipi  like '%" + Id + "%' ", con);
            SqlDataReader reader4 = com4.ExecuteReader();
            while (reader4.Read())
            {
                string SCId = reader4["Id"].ToString();
                string[] SCHizmet = (reader4["HizmetTipi"].ToString()).Split(',');
                List<string> s = new List<string>();
                for (int j = 0; j < SCHizmet.Length; j++)
                {
                    if (SCHizmet[j] != Id.ToString())
                    {
                        s.Add(SCHizmet[j]);
                    }
                }
                string deger = string.Join(",", s.ToArray());
                query += "UPDATE ExtraServiceContract SET HizmetTipi='" + deger + "' WHERE Id='" + SCId + "' ;";
            }
            reader4.Close();

            SqlCommand com3 = new SqlCommand("SELECT Id,HizmetTipi FROM ServiceContract WHERE HizmetTipi like '%" + Id + "%' ", con);
            SqlDataReader reader3 = com3.ExecuteReader();
            while (reader3.Read())
            {
                string SCId = reader3["Id"].ToString();
                string[] SCHizmet = (reader3["HizmetTipi"].ToString()).Split(',');
                List<string> s = new List<string>();
                for (int j = 0; j < SCHizmet.Length; j++)
                {
                    if (SCHizmet[j] != Id.ToString())
                    {
                        s.Add(SCHizmet[j]);
                    }
                }
                string deger = string.Join(",", s.ToArray());
                query += "UPDATE ServiceContract SET HizmetTipi='" + deger + "' WHERE Id='" + SCId + "' ;";
            }

            reader3.Close();

            SqlCommand com = new SqlCommand("DELETE FROM Service WHERE Id=@Id;" + query + "", con);
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Service_UPDATE()
        {
            int id = int.Parse(Request["Id"]);
            string hizmetadi = Request["HizmetAdi"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Service SET HizmetAdi= @HizmetAdi WHERE Id= @Id";
            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("HizmetAdi", hizmetadi);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public string ServiceGroup_GET()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM ServiceGroup", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        [HttpPost]
        public void ServiceGroup_SET()
        {
            string servicegroup = Request["HizmetGrup"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO ServiceGroup (HizmetGrup) VALUES (@HizmetGrup)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("HizmetGrup", servicegroup);
            Debug.Print(query);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        [HttpPost]
        public void ServiceGroup_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM ServiceGroup WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        [HttpPost]
        public void ServiceGroup_UPDATE()
        {
            int id = int.Parse(Request["Id"]);
            string hizmetgrup = Request["HizmetGrup"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE ServiceGroup SET HizmetGrup = @HizmetGrup WHERE Id= @Id";
            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("HizmetGrup", hizmetgrup);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public string Customer_GET_DATA()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Service ; SELECT * FROM Customers_View", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();

            Dictionary<int, string> hizmetlist = new Dictionary<int, string>();
            while (reader.Read())
            {
                hizmetlist.Add(int.Parse(reader["Id"].ToString()), reader["HizmetAdi"].ToString());
            }

            reader.NextResult();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    if (reader[i].ToString() == "")
                    {
                        JO.Add(reader.GetName(i), "TANIMLI DEĞİL");
                    }
                    else
                    {
                        string a = reader.GetName(i);
                        string aa = reader[i].ToString();
                        if (reader.GetName(i) == "HizmetId")
                        {

                            StringBuilder hizmetadlari = new StringBuilder();
                            string[] ids = reader[i].ToString().Split(',');
                            for (int j = 0; j < ids.Length; j++)
                            {
                                ids[j] = hizmetlist[int.Parse(ids[j])];
                            }
                            JO.Add("Hizmet", string.Join(",", ids));
                        }

                        else
                        {
                            JO.Add(reader.GetName(i), reader[i].ToString());
                        }
                    }


                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        [HttpPost]

        public string Customer_SET_DATA()
        {
            Random rd = new Random();
            int a = rd.Next(0, 255);
            int b = rd.Next(0, 255);
            int c = rd.Next(0, 255);
            string renk = "rgb(" + a.ToString() + ", " + b.ToString() + ", " + c.ToString() + ")";
            string ad = Request["Ad"];
            string faturaunvani = Request["FaturaUnvani"];
            string hizmet = Request["HizmetAdi"];
            string telno = Request["TelNo"];
            string email = Request["Email"];
            string il = Request["Il"];
            string ilce = Request["Ilce"];
            string adres = Request["Adres"];
            string firmatip = Request["FirmaTip"];
            string sektor = Request["Sektor"];
            string aktif = Request["Aktif"];
            string firmatur = Request["FirmaTur"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "INSERT INTO CUSTOMER ( Bind, Ad, FaturaUnvani, TelNo, Email, IlId, Ilce, Adres, HizmetId, FirmaTipId, SektorId, DurumId, FirmaTurId, Renk) VALUES (NEWID(), @Ad, @FaturaUnvani, @TelNo, @Email, @Il, @Ilce, @Adres, @HizmetAdi, @FirmaTip, @Sektor, @Aktif, @FirmaTur, @Renk)";
            Debug.Print(query);
            SqlCommand com = new SqlCommand(query, con);
            con.Open();

            com.Parameters.AddWithValue("Ad", ad.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("FaturaUnvani", faturaunvani.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("HizmetAdi", hizmet);
            com.Parameters.AddWithValue("Telno", telno.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("Email", email);
            com.Parameters.AddWithValue("Il", il);
            com.Parameters.AddWithValue("Ilce", ilce.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("Adres", adres.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("FirmaTip", firmatip);
            com.Parameters.AddWithValue("Sektor", sektor);
            com.Parameters.AddWithValue("Aktif", aktif);
            com.Parameters.AddWithValue("FirmaTur", firmatur);
            com.Parameters.AddWithValue("Renk", renk);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            return "1";
        }
        public string Customer_UPDATE_DATA()
        {
            int id = int.Parse(Request["Id"]);
            string ad = Request["Ad"];
            string faturaunvani = Request["FaturaUnvani"];
            string hizmet = Request["Hizmet"];
            string sektor = Request["Sektor"];
            string firmatip = Request["FirmaTip"];
            string firmatur = Request["FirmaTur"];
            string il = Request["Il"];
            string ilce = Request["Ilce"];
            string adres = Request["Adres"];
            string email = Request["Email"];
            string telefon = Request["Telefon"];
            string durum = Request["Durum"];


            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Customer SET Ad = @Ad, FaturaUnvani= @FaturaUnvani, HizmetId=@Hizmet, TelNo= @Telefon, Email= @Email, IlId= @Il, Ilce= @Ilce, Adres= @Adres, FirmaTipId= @FirmaTip, SektorId= @Sektor,FirmaTurId=@FirmaTur, DurumId= @Aktif WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Ad", ad);
            com.Parameters.AddWithValue("FaturaUnvani", faturaunvani.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("Hizmet", hizmet);
            com.Parameters.AddWithValue("Telefon", telefon);
            com.Parameters.AddWithValue("Email", email);
            com.Parameters.AddWithValue("Il", il);
            com.Parameters.AddWithValue("Ilce", ilce);
            com.Parameters.AddWithValue("Adres", adres);
            com.Parameters.AddWithValue("FirmaTip", firmatip);
            com.Parameters.AddWithValue("Sektor", sektor);
            com.Parameters.AddWithValue("Aktif", durum);
            com.Parameters.AddWithValue("FirmaTur", firmatur);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            return "1";
        }
        [HttpPost]
        public void Employee_UPDATE_DATA()
        {

            string id = Request["Id"];
            string ad = Request["Ad"];
            string soyad = Request["Soyad"];
            string sifre = Request["Sifre"];
            string aracplaka = Request["AracPlaka"];
            string bolgeId = Request["BolgeId"];
            string adres = Request["Adres"];
            string email = Request["Email"];
            string ceptel = Request["CepTel"];

            string guidId = Guid.NewGuid().ToString();
            string ResimName;
            string resimPath = Request["Resim"];
            if (Request.Files.Count > 0)
            {
                HttpPostedFileBase file = Request.Files[0];
                ResimName = guidId + Path.GetExtension(file.FileName);
                resimPath = "/Files/Image/" + ResimName.ToString();
                var path = Path.Combine(Server.MapPath("~/Files/Image/"), ResimName);
                file.SaveAs(path);

            }

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Employee SET Ad = @Ad, Soyad= @Soyad, Sifre= @Sifre, AracPlaka= @AracPlaka, BolgeId= @BolgeId, Adres= @Adres, Email= @Email, CepTel= @CepTel, Fotograf=@Resim WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Ad", ad);
            com.Parameters.AddWithValue("Soyad", soyad);
            com.Parameters.AddWithValue("Sifre", sifre);
            com.Parameters.AddWithValue("AracPlaka", aracplaka);
            com.Parameters.AddWithValue("BolgeId", bolgeId);
            com.Parameters.AddWithValue("Adres", adres);
            com.Parameters.AddWithValue("Email", email);
            com.Parameters.AddWithValue("CepTel", ceptel);
            com.Parameters.AddWithValue("Resim", resimPath);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }

        public string Customer_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "DELETE FROM Customer WHERE Id = @Id; DELETE FROM Authorized WHERE CustomerId = @Id";
            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            return "1";
        }
        [HttpPost]
        public string Authorized_SET_DATA()
        {
            int custId = int.Parse(Request["CustomerId"]);
            string ad = Request["Ad"];
            string soyad = Request["Soyad"];
            string unvan = Request["Unvan"];
            string telefon = Request["Telefon"];
            string email = Request["Email"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO AUTHORİZED ( CustomerId, Bind, Ad, Soyad, Unvan, Telefon, Email) VALUES (@CustomerId, NEWID(), @Ad, @Soyad, @Unvan, @Telefon, @Email)";

            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("CustomerId", custId);
            com.Parameters.AddWithValue("Ad", ad.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("Soyad", soyad.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("Unvan", unvan.ToUpper(new CultureInfo("tr-TR", false)));
            com.Parameters.AddWithValue("Telefon", telefon);
            com.Parameters.AddWithValue("Email", email);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            return "1";
        }
        public string Authorized_GET_DATA(int CustomerId)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);

            SqlCommand com = new SqlCommand("SELECT * FROM Authorized WHERE CustomerId=@CustomerId", con);
            com.Parameters.AddWithValue("CustomerId", CustomerId);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            string AdSoyad = "";
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    if (reader.GetName(i) == "Ad")
                    {
                        JO["AdSoyad"] = reader["Ad"].ToString() + " " + reader["Soyad"].ToString();
                        Session["AdSoyad"] = JO["AdSoyad"].ToString();
                        JO.Add(reader.GetName(i), reader["Ad"].ToString());
                        ViewBag.Name = Session["AdSoyad"].ToString();
                    }
                    else
                    {
                        JO.Add(reader.GetName(i), reader[i].ToString());
                    }

                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public string CustomerActivity_GET(int id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "SELECT * FROM CustomerActivity WHERE MusteriId=@MusteriId";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("MusteriId", id);
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();

            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void Authorized_UPDATE_DATA(int Id)
        {
            string ad = Request["Ad"];
            string soyad = Request["Soyad"];
            string unvan = Request["Unvan"];
            string telefon = Request["Telefon"];
            string email = Request["Email"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Authorized SET Ad = @Ad, Soyad= @Soyad, Unvan= @Unvan, Telefon= @Telefon, Email= @Email WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.Parameters.AddWithValue("Ad", ad);
            com.Parameters.AddWithValue("Soyad", soyad);
            com.Parameters.AddWithValue("Unvan", unvan);
            com.Parameters.AddWithValue("Telefon", telefon);
            com.Parameters.AddWithValue("Email", email);
            int kayıt = com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public string Authorized_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);

            SqlCommand com = new SqlCommand("DELETE FROM Authorized WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
            return "1";
        }
        public string City_GET_DATA()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM City", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public string CustomerType_GET_DATA()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM CustomerType", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    if (reader.GetDataTypeName(i) == "date" || reader.GetDataTypeName(i) == "datetime")
                    {
                        JO.Add(reader.GetName(i), DateTime.ParseExact(reader[i].ToString(), "yyyy-MM-dd", null).ToString("dd.MM.yyyy"));
                    }
                    else
                        JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void CustomerType_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM CustomerType WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerType_SET_DATA()
        {
            string tur = Request["firmatur"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO CustomerType (FirmaTur) VALUES (@FirmaTur)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("FirmaTur", tur);
            Debug.Print(query);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerType_UPDATE_DATA()
        {
            int id = int.Parse(Request["Id"]);
            string firmatur = Request["FirmaTur"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE CustomerType SET FirmaTur = @firmatur WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("firmatur", firmatur);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();

        }
        public string CustomerKind_GET_DATA()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM CustomerKind", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);

        }
        public void CustomerKind_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM CustomerKind WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerKind_SET_DATA()
        {
            string tip = Request["firmatip"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO CustomerKind (FirmaTip) VALUES (@FirmaTip)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("FirmaTip", tip);
            Debug.Print(query);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerKind_UPDATE_DATA()
        {
            int id = int.Parse(Request["Id"]);
            string firmatip = Request["FirmaTip"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE CustomerKind SET FirmaTip = @firmatip WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("firmatip", firmatip);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();

        }
        public string Sector_GET_DATA()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Sector", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void Sector_DELETE_DATA(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM Sector WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Sector_SET_DATA()
        {
            string sector = Request["Sektor"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO Sector (Sektor) VALUES (@Sektor)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("Sektor", sector);
            Debug.Print(query);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Sector_UPDATE_DATA()
        {
            int id = int.Parse(Request["Id"]);
            string sector = Request["Sektor"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Sector SET Sektor = @Sektor WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Sektor", sector);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();

        }
        public string Situation_GET_DATA()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Situation", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void Situation_DELETE_DATA(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM Situation WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Situation_SET_DATA()
        {
            string durum = Request["Durum"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO Situation (Durum) VALUES (@Durum)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("Durum", durum);
            Debug.Print(query);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Situation_UPDATE_DATA()
        {
            int id = int.Parse(Request["Id"]);
            string durum = Request["Durum"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Situation SET Durum = @Durum WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Durum", durum);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();

        }
        [HttpPost]
        public string CustomerOne(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string Query = "SELECT * FROM Customer WHERE Id = @Id";
            SqlCommand com = new SqlCommand(Query, con);
            com.Parameters.AddWithValue("Id", Id);
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);

        }
        public string Employees_GET()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Region; SELECT * FROM Employee", con);
            SqlDataReader reader = com.ExecuteReader();

            Dictionary<int, string> arr = new Dictionary<int, string>();
            while (reader.Read())
            {
                arr.Add(int.Parse(reader["Id"].ToString()), reader["Bolge"].ToString());

            }
            reader.NextResult();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    if (reader.GetName(i) == "BolgeId")
                    {
                        StringBuilder bolgeadlari = new StringBuilder();
                        string[] ids = reader[i].ToString().Split(','); //[1, 2, 3] //["Marma", "ekrjg", "njkntg"]
                        for (int j = 0; j < ids.Length; j++)
                        {
                            ids[j] = arr[int.Parse(ids[j])];
                        }
                        JO.Add("BolgeAdlari", string.Join(",", ids));
                    }
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            ViewBag.Bolge = arr;
            return JsonConvert.SerializeObject(JA);

        }
        public string Regions_GET()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Region", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);

        }
        public void Regions_DELETE(int Id)
        {
            SqlConnection con2 = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com2 = new SqlCommand("SELECT Id,BolgeId FROM Employee where BolgeId  like '%" + Id + "%' ", con2);
            con2.Open();
            SqlDataReader reader2 = com2.ExecuteReader();
            string query = "";
            while (reader2.Read())
            {
                string EId = reader2["Id"].ToString();
                string[] Ebolge = (reader2["BolgeId"].ToString()).Split(',');
                List<string> s = new List<string>();
                for (int j = 0; j < Ebolge.Length; j++)
                {
                    if (Ebolge[j] != Id.ToString())
                    {
                        s.Add(Ebolge[j]);
                    }
                }
                string deger = string.Join(",", s.ToArray());
                query += "UPDATE Employee SET BolgeId='" + deger + "' WHERE Id='" + EId + "' ;";
            }

            reader2.Close();
            con2.Close();

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("DELETE FROM Region WHERE Id=@Id;" + query + "", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);

            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();


        }
        public void Regions_SET_DATA()
        {
            string bolge = Request["Bolge"];
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO Region (Bolge) VALUES (@Bolge)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("Bolge", bolge);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Regions_UPDATE_DATA()
        {
            int id = int.Parse(Request["Id"]);
            string bolge = Request["Bolge"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE Region SET Bolge = @Bolge WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Bolge", bolge);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();

        }
        [HttpPost]
        public void Employee_SET(string Resim, string Ad, string Soyad, string Sifre, string AracPlaka, string Bolge, string Adres, string Email, string TelefonNo)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();

            string guidId = Guid.NewGuid().ToString();
            string ResimName;
            string resimPath = "";
            if (Request.Files.Count > 0)
            {
                HttpPostedFileBase file = Request.Files[0];
                ResimName = guidId + Path.GetExtension(file.FileName);
                resimPath = "/Files/Image/" + ResimName.ToString();
                var path = Path.Combine(Server.MapPath("~/Files/Image/"), ResimName);
                file.SaveAs(path);

            }

            string query = "INSERT INTO Employee ( Bind, Ad, Soyad, Sifre, AracPlaka, BolgeId, Adres, Email, CepTel, Fotograf) VALUES (NEWID(),@Ad, @Soyad, @Sifre, @AracPlaka, @Bolge, @Adres, @Email, @TelefonNo, @Fotograf)";

            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("Ad", Ad);
            com.Parameters.AddWithValue("Soyad", Soyad);
            com.Parameters.AddWithValue("Sifre", Sifre);
            com.Parameters.AddWithValue("AracPlaka", AracPlaka);
            com.Parameters.AddWithValue("Bolge", Bolge);
            com.Parameters.AddWithValue("Adres", Adres);
            com.Parameters.AddWithValue("Email", Email);
            com.Parameters.AddWithValue("TelefonNo", TelefonNo);
            com.Parameters.AddWithValue("Fotograf", resimPath);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void Employee_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);

            SqlCommand com = new SqlCommand("DELETE FROM Employee WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public string SozlesmeEmployee()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT * FROM Employee", con);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void Sozlesme_SET(string hizmetler)
        {
            JArray JA = JArray.Parse(hizmetler);
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "";
            con.Open();
            foreach (var item in JA)
            {
                JObject JO = (JObject)item;
                query += string.Format("INSERT INTO ServiceContract ( Bind, HizmetTipi, Personel, Tarih, Aciklama, MusteriId) VALUES (NEWID(),'{0}','{1}','{2}','{3}','{4}')", JO["HizmetAdi"].ToString(), JO["Personel"].ToString(), JO["Tarih"], JO["Aciklama"], JO["MusteriId"]);

                query += string.Format("INSERT INTO EmployeeNotification ( Icerik, MusteriId, Durum, EklendigiTarih, GosterilecegiTarih, EmployeeId) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}')", JO["HizmetAdi"].ToString(), JO["MusteriId"], "OKUNMADI", DateTime.Now, JO["Tarih"], JO["Personel"].ToString());

            }

            SqlCommand com = new SqlCommand(query, con);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void EkSozlesme_SET()
        {
            string hizmettipi = Request["HizmetTipi"];
            string personel = Request["Personel"];
            string tarih = Request["Tarih"];
            string aciklama = Request["Aciklama"];
            string musteriId = Request["MusteriId"];
            string durum = "OKUNMADI";
            DateTime t = DateTime.Now;
            string query = "";
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
             query = "INSERT INTO ExtraServiceContract (Bind, HizmetTipi, Personel, Tarih, Aciklama, MusteriId) VALUES (NEWID(), @HizmetTipi, @Personel, @Tarih, @Aciklama, @MusteriId)";

            query += " INSERT INTO EmployeeNotification ( Icerik, MusteriId, Durum, EklendigiTarih, GosterilecegiTarih, EmployeeId) VALUES (@HizmetTipi, @MusteriId, 'OKUNMADI', @t, @Tarih, @Personel)";
            SqlCommand com = new SqlCommand(query, con);

            com.Parameters.AddWithValue("HizmetTipi", hizmettipi);
            com.Parameters.AddWithValue("Personel", personel);
            com.Parameters.AddWithValue("Tarih", tarih);
            com.Parameters.AddWithValue("Aciklama", aciklama);
            com.Parameters.AddWithValue("MusteriId", musteriId);
            com.Parameters.AddWithValue("Durum", durum);
            com.Parameters.AddWithValue("t", t);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void StationCustomer_SET(string istasyonlar)
        {
            JArray JA = JArray.Parse(istasyonlar);
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "";
            con.Open();
            foreach (var item in JA)
            {
                query += " SET DATEFORMAT YMD;\n";
                JObject JO = (JObject)item;
                query += string.Format("INSERT INTO StationCustomer ( MusteriId, IstasyonId, Yer, Tarih, Aciklama, Numara) VALUES ({0},{1},'{2}','{3}','{4}',{5})", JO["MusteriId"], JO["IstasyonId"].ToString(), JO["Yer"], JO["Tarih"], JO["Aciklama"], JO["Numara"]);
            }

            SqlCommand com = new SqlCommand(query, con);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();

        }
        public int StationCustomerNumber(int MusteriId)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            SqlCommand com = new SqlCommand("SELECT TOP 1  Numara FROM StationCustomer WHERE MusteriId=@MusteriId Order By Numara DESC", con);
            com.Parameters.AddWithValue("MusteriId", MusteriId);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            int number = 0;
            while (reader.Read())
            {
                number = int.Parse(reader["Numara"].ToString());
            }

            reader.Close();
            con.Close();
            return number;
        }
        public string StationCustomer_GET(int MusteriId)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM CustomerStation_View WHERE MusteriId=@MusteriId", con);
            com.Parameters.AddWithValue("MusteriId", MusteriId);

            SqlDataReader reader = com.ExecuteReader();
            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    JO.Add(reader.GetName(i), reader[i].ToString());
                }

                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public void StationCustomer_UPDATE()
        {
            int id = int.Parse(Request["Id"]);
            int istasyonid = int.Parse(Request["IstasyonId"]);
            string yer = Request["Yer"];
            string tarih = Request["Tarih"];
            string aciklama = Request["Aciklama"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE StationCustomer SET IstasyonId=@IstasyonId, Yer=@Yer, Tarih=@Tarih, Aciklama=@Aciklama WHERE Id=@Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("IstasyonId", istasyonid);
            com.Parameters.AddWithValue("Yer", yer);
            com.Parameters.AddWithValue("Tarih", tarih);
            com.Parameters.AddWithValue("Aciklama", aciklama);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void StationCustomer_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);

            SqlCommand com = new SqlCommand("DELETE FROM StationCustomer WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerActivity_SET()
        {
            string musterid = Request["MusteriId"];
            string aktivite = Request["Aktivite"];
            string yetkili = Request["Yetkili"];
            string aktivitenotu = Request["AktiviteNotu"];
            string aktivitesonucu = Request["AktiviteSonucu"];
            string hatirlatma = Request["Hatirlatma"];
            string hatirlatmaMesaji = Request["HatirlatmaMesaji"];
            string hatirlatmaTarihi = Request["HatirlatmaTarihi"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            string query = "INSERT INTO CustomerActivity (MusteriId, Aktivite, Yetkili, AktiviteNotu, AktiviteSonucu, Hatirlatma, HatirlatmaMesaji, HatirlatmaTarihi, Aktif) VALUES (@MusteriId, @Aktivite, @Yetkili,  @AktiviteNotu, @AktiviteSonucu, @Hatirlatma, @HatirlatmaMesaji, @HatirlatmaTarihi, 1)";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("MusteriId", musterid);
            com.Parameters.AddWithValue("Aktivite", aktivite);
            com.Parameters.AddWithValue("Yetkili", yetkili);
            com.Parameters.AddWithValue("AktiviteNotu", aktivitenotu);
            com.Parameters.AddWithValue("AktiviteSonucu", aktivitesonucu);
            com.Parameters.AddWithValue("Hatirlatma", hatirlatma);
            com.Parameters.AddWithValue("HatirlatmaMesaji", hatirlatmaMesaji);
            com.Parameters.AddWithValue("HatirlatmaTarihi", hatirlatmaTarihi);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerActivity_UPDATE()
        {
            int id = int.Parse(Request["id"]);
            string aktivite = Request["Aktivite"];
            string yetkili = Request["Yetkili"];
            string aktivitenotu = Request["AktiviteNotu"];
            string aktivitesonucu = Request["AktiviteSonucu"];
            string hatirlatma = Request["Hatirlatma"];
            string hatirlatmamesaji = Request["HatirlatmaMesaji"];
            string hatirlatmatarihi = Request["HatirlatmaTarihi"];

            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string query = "UPDATE CustomerActivity SET Aktivite = @Aktivite, Yetkili=@Yetkili, AktiviteNotu=@AktiviteNotu, AktiviteSonucu=@AktiviteSonucu, Hatirlatma=@Hatirlatma, HatirlatmaMesaji=@HatirlatmaMesaji, HatirlatmaTarihi=@HatirlatmaTarihi WHERE Id= @Id";

            SqlCommand com = new SqlCommand(query, con);
            con.Open();
            com.Parameters.AddWithValue("Id", id);
            com.Parameters.AddWithValue("Aktivite", aktivite);
            com.Parameters.AddWithValue("Yetkili", yetkili);
            com.Parameters.AddWithValue("AktiviteNotu", aktivitenotu);
            com.Parameters.AddWithValue("AktiviteSonucu", aktivitesonucu);
            com.Parameters.AddWithValue("Hatirlatma", hatirlatma);
            com.Parameters.AddWithValue("HatirlatmaMesaji", hatirlatmamesaji);
            com.Parameters.AddWithValue("HatirlatmaTarihi", hatirlatmatarihi);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public void CustomerActivity_DELETE(int Id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);

            SqlCommand com = new SqlCommand("DELETE FROM CustomerActivity WHERE Id=@Id", con);
            con.Open();
            com.Parameters.AddWithValue("Id", Id);
            com.ExecuteNonQuery();
            con.Close();
            con.Dispose();
        }
        public string EmployeeNotification_GET()
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Service ; SELECT C.Ad, EN.Id, EN.MusteriId, EN.Icerik, EN.Durum, EN.GosterilecegiTarih, EN.EmployeeId  FROM EmployeeNotification AS EN JOIN Customer AS C ON C.Id=EN.MusteriId WHERE EN.EmployeeId=@Id AND EN.Durum='OKUNMADI' AND CAST(EN.GosterilecegiTarih AS DATE)<= CAST(GETDATE() AS DATE);", con);
            com.Parameters.AddWithValue("Id", Session["EmployeeId"].ToString());
            SqlDataReader reader = com.ExecuteReader();
            Dictionary<int, string> hizmet = new Dictionary<int, string>();
            while (reader.Read())
            {
                hizmet.Add(int.Parse(reader["Id"].ToString()), reader["HizmetAdi"].ToString());
            }

            reader.NextResult();

            JArray JA = new JArray();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    if (reader.GetName(i) == "Icerik")
                    {
                        string[] ids = reader[i].ToString().Split(',');
                        for (int j = 0; j < ids.Length; j++)
                        {
                            ids[j] = hizmet[int.Parse(ids[j])];
                        }
                        JO.Add("Hizmet", string.Join(",", ids));
                    }

                    else
                    {
                        JO.Add(reader.GetName(i), reader[i].ToString());
                    }
                   
                }
                JA.Add(JO);
            }
            reader.Close();
            con.Close();
            return JsonConvert.SerializeObject(JA);
        }
        public string EmployeeNotification_SET(int Id)
        {
            string query = "";
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            try
            {
                query = "UPDATE EmployeeNotification SET Durum='OKUNDU' WHERE Id=@Id";
                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.AddWithValue("Id", Id);
                com.ExecuteNonQuery();
                con.Close();
                con.Dispose();
                return "1";
            }
            catch (Exception ex)
            {
                con.Close();
                return ex.ToString();

            }
        }
    }
}



