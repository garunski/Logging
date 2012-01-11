using System.Web.Mvc;
using System;
using log4net;

namespace Logging.Areas.Logging.Controllers
{
	public class HomeController : Controller
	{
		private static readonly ILog log = LogManager.GetLogger(typeof(HomeController));

		public ActionResult Index()
		{
			log.Error("my message", new Exception());
			return View();
		}
	}
}