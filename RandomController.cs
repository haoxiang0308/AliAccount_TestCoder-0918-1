using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        // GET: api/Random
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { Message = "This is a random API endpoint." });
        }

        // GET: api/Random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { Id = id, Name = "Random Item" });
        }

        // POST: api/Random
        [HttpPost]
        public IActionResult Post([FromBody] string value)
        {
            return CreatedAtAction(nameof(Get), new { id = 1 }, value);
        }

        // PUT: api/Random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            return NoContent();
        }

        // DELETE: api/Random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return NoContent();
        }
    }
}