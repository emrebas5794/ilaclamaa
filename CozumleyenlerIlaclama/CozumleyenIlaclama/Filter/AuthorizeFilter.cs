using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Configuration;

namespace CozumleyenIlaclama.Filter
{
    public class AuthorizeFilter : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session["Email"] == null || httpContext.Session["IPAddress"] == null || httpContext.Session["LastActivity"] == null)
            {
                return false;
            }

            if (!httpContext.Session["IPAddress"].ToString().Equals(httpContext.Request.UserHostAddress))
            {
                return false;
            }

            if (DateTime.Now.AddMinutes(-int.Parse((httpContext.Session.Timeout).ToString())) > DateTime.Parse(httpContext.Session["LastActivity"].ToString()))
            {
                return false;
            }
            httpContext.Session["LastActivity"] = DateTime.Now;
            return true;
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAjaxRequest())
            {
                filterContext.HttpContext.Response.ClearContent();
                filterContext.HttpContext.Response.StatusCode = 460;
                return;
            }
            string url = "~/Main/Login/";
            filterContext.Result = new RedirectResult(url);
            
        }
    }
}