using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleDataController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<SampleDataController> _logger;

        public SampleDataController(ILogger<SampleDataController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var rng = new Random();
            var forecast = new WeatherForecast
            {
                Date = DateTime.Now.AddDays(id),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)]
            };
            
            if (id < 1)
            {
                return BadRequest("Invalid ID");
            }
            
            return Ok(forecast);
        }

        [HttpPost]
        public IActionResult Post([FromBody] WeatherForecast forecast)
        {
            if (forecast == null)
            {
                return BadRequest("Forecast data is required");
            }
            
            var result = new 
            {
                Success = true,
                Message = "Weather forecast added successfully",
                Data = forecast
            };
            
            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] WeatherForecast forecast)
        {
            if (forecast == null)
            {
                return BadRequest("Forecast data is required");
            }
            
            var result = new 
            {
                Success = true,
                Message = $"Weather forecast {id} updated successfully",
                Data = forecast
            };
            
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new 
            {
                Success = true,
                Message = $"Weather forecast {id} deleted successfully"
            };
            
            return Ok(result);
        }
    }
    
    public class WeatherForecast
    {
        public DateTime Date { get; set; }
        public int TemperatureC { get; set; }
        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
        public string? Summary { get; set; }
    }
}
