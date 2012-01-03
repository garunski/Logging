namespace Logging.Areas.Logging.Domain.Model
{
	public class LogEntry
	{
		public int Id { get; set; }

		public LogException Exception { get; set; }

		public string Message { get; set; }

		public Logger Logger { get; set; }

		public LoggingApplication Application { get; set; }

		public SeverityLevel Severity { get; set; }

		public string Server { get; set; }
	}
}