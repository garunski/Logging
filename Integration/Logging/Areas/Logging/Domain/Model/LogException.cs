namespace Logging.Areas.Logging.Domain.Model
{
	public class LogException
	{
		public int Id { get; set; }

		public LogException InnerException { get; set; }

		public string Message { get; set; }

		public string StackTrace { get; set; }

		public string HelpLink { get; set; }

		public string Source { get; set; }

		public string ThrownFrom { get; set; }

		public string HResult { get; set; }
	}
}