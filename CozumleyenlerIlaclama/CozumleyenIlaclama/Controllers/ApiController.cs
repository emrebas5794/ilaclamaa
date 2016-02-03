using CozumleyenIlaclama.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;

namespace CozumleyenIlaclama.Controllers
{
    public class ApiController : Controller
    {
        // GET: Api
      
        public string Personel(string KullaniciAdi, string Sifre)
        {
          
           JObject jo = new JObject();
            JObject response = new JObject();
            SqlConnection connection = new SqlConnection(DbConfiguration.ConnectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM Employee WHERE Email=@KullaniciAdi AND Sifre=@Sifre", connection);
            command.Parameters.AddWithValue("KullaniciAdi", KullaniciAdi);
            command.Parameters.AddWithValue("Sifre", Sifre);
            SqlDataReader reader = command.ExecuteReader();
            if (!reader.HasRows)
            {
                jo.Add("deger", "Eposta sistemde kayıtlı bulunamadı");
                response.Add("KullaniciGiris", jo);

                return JsonConvert.SerializeObject(response);
            }


            reader.Read();
           

            for (int i = 0; i < reader.FieldCount; i++)
            {

                if (reader.GetDataTypeName(i) == "date")
                {
                    DateTime date;
                    jo.Add(reader.GetName(i), DateTime.TryParse(reader[i].ToString(), out date) ? date.ToString("dd.MM.yyyy") : "");
                }
                else if (reader.GetName(i) == "Sifre")
                {

                }
                else
                {
                    jo.Add(reader.GetName(i), reader[i].ToString());
                }
            }

            connection.Close();
            reader.Close();

            //Check if password is right

            jo.Add("deger", "Ok");
            response.Add("KullaniciGiris", jo);

            return JsonConvert.SerializeObject(response);
            }

                
          
        

        [HttpPost]
        public string Bildirim(int id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Service ; SELECT C.Ad, EN.Id, EN.MusteriId, EN.Icerik, EN.Durum, EN.GosterilecegiTarih, EN.EmployeeId  FROM EmployeeNotification AS EN JOIN Customer AS C ON C.Id=EN.MusteriId WHERE EN.EmployeeId=@Id AND EN.Durum='OKUNMADI' AND CAST(EN.GosterilecegiTarih AS DATE)<= CAST(GETDATE() AS DATE);", con);
            com.Parameters.AddWithValue("Id", id);
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

        public string ServicesCalender(string id)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string Query = "SELECT TTarih as Tarih ,count(TTarih) AS Sayi from(SELECT  CAST(Tarih As Date) as TTarih  FROM ExtraServiceContract AS ES WHERE ES.Personel=@id)tablo Group by TTarih UNION ALL SELECT TTarih as Tarih ,count(TTarih) AS Sayi from(SELECT CAST(S.Tarih As Date) as TTarih  FROM ServiceContract AS S   WHERE S.Personel=@id)tablo2 Group by TTarih ";
            SqlCommand com = new SqlCommand(Query, con);
            com.Parameters.AddWithValue("id", id);
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            Dictionary<int, string> arr = new Dictionary<int, string>();   
            JArray JA = new JArray();
            JObject JAA = new JObject();
          
            while (reader.Read())
            {
               
                JObject JO = new JObject();
                
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                    if (reader.GetDataTypeName(i) == "date")
                    {
                        DateTime date;
                        JO.Add(reader.GetName(i), DateTime.TryParse(reader[i].ToString(), out date) ? date.ToString("d.M.yyyy") : "");
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
            JAA.Add("TakvimVeri",JA);
            return JsonConvert.SerializeObject(JAA);
        }

        public string CalenderClock(string id, string date)
        {
            SqlConnection con = new SqlConnection(DbConfiguration.ConnectionString);
            string Query = "SELECT * FROM Service ; SELECT   ES.Tarih, ES.HizmetTipi, C.Ad, C.Renk FROM   ExtraServiceContract AS ES JOIN Customer AS C ON C.Id = ES.MusteriId WHERE ES.Personel=@id and   CAST(ES.Tarih As Date)=@tarih UNION ALL SELECT  S.Tarih, S.HizmetTipi, C.Ad, C.Renk FROM  ServiceContract AS S JOIN  Customer AS C ON C.Id = S.MusteriId WHERE S.Personel=@id and   CAST(S.Tarih As Date)=@tarih";
            SqlCommand com = new SqlCommand(Query, con);
            com.Parameters.AddWithValue("id", id);
            com.Parameters.AddWithValue("tarih", DateTime.Parse(date).ToString("yyyy.MM.dd"));
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            Dictionary<int, string> arr = new Dictionary<int, string>();
            while (reader.Read())
            {
                arr.Add(int.Parse(reader["Id"].ToString()), reader["HizmetAdi"].ToString());

            }
            reader.NextResult();
            JArray JA = new JArray();
            JObject JOO = new JObject();
            while (reader.Read())
            {
                JObject JO = new JObject();
                for (int i = 0; i < reader.VisibleFieldCount; i++)
                {
                   
                    if (reader.GetName(i) == "HizmetTipi")
                    {
                       
                        string[] ids = reader[i].ToString().Split(',');
                        for (int j = 0; j < ids.Length; j++)
                        {
                            ids[j] = arr[int.Parse(ids[j])];
                        }
                        JO.Add("HizmetTipAdi", string.Join(",", ids));
                    }
                    else if (reader.GetName(i) == "Tarih")
                    {
                        DateTime dates;
                        JO.Add(reader.GetName(i), DateTime.TryParse(reader[i].ToString(), out dates) ? dates.ToString("H:mm") : "");
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
            JOO.Add("SecilenTarihVeri", JA);
            return JsonConvert.SerializeObject(JOO);
        }
    }
}