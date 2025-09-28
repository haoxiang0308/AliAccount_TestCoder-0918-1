using Microsoft.AspNetCore.Mvc;

namespace RandomApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomDataController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            var random = new Random();
            return Ok(Enumerable.Range(1, 5).Select(index => new { Id = index, Name = Summaries[random.Next(Summaries.Length)] }).ToArray());
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            if (id < 1 || id > Summaries.Length)
            {
                return NotFound();
            }
            return Ok(new { Id = id, Name = Summaries[id - 1] });
        }

        [HttpPost]
        public ActionResult Post([FromBody] string value)
        {
            // Example POST logic
            return Ok(new { Message = "Received", Value = value });
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] string value)
        {
            // Example PUT logic
            return Ok(new { Message = "Updated", Id = id, Value = value });
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            // Example DELETE logic
            return Ok(new { Message = "Deleted", Id = id });
        }
    }
}