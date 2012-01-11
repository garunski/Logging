using log4net.Appender;
using log4net.Core;

namespace Logging.Log4NetAppender
{
	using System.Data.Common;

	public class LoggingLog4NetAppender : AppenderSkeleton
	{
		public string ConnectionString { get; set; }

		public string ConnectionType { get; set; }

		protected override void Append(LoggingEvent loggingEvent)
		{
			var connection = this.ConnectionString;

			var providerFactory = DbProviderFactories.GetFactory(this.ConnectionType);

			//providerFactory.
		}
	}
}
