using System.Web.Mvc;

namespace Logging.Areas.Logging
{
	public class LoggingAreaRegistration : AreaRegistration
	{
		public override string AreaName
		{
			get
			{
				return "logging";
			}
		}

		public override void RegisterArea(AreaRegistrationContext context)
		{
			context.MapRoute(
				"logging_default",
				"logging/{controller}/{action}/{id}",
				new { action = "index", id = UrlParameter.Optional }
			);
		}
	}
}
