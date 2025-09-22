using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemsController : ControllerBase
    {
        private static List<string> _items = new List<string>
        {
            "Item 1",
            "Item 2",
            "Item 3"
        };

        // GET: api/items
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return Ok(_items);
        }

        // GET: api/items/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            if (id < 0 || id >= _items.Count)
            {
                return NotFound();
            }
            return Ok(_items[id]);
        }

        // POST: api/items
        [HttpPost]
        public ActionResult<string> Post([FromBody] string value)
        {
            _items.Add(value);
            return CreatedAtAction(nameof(Get), new { id = _items.Count - 1 }, value);
        }

        // PUT: api/items/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            if (id < 0 || id >= _items.Count)
            {
                return NotFound();
            }

            _items[id] = value;
            return NoContent();
        }

        // DELETE: api/items/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0 || id >= _items.Count)
            {
                return NotFound();
            }

            _items.RemoveAt(id);
            return NoContent();
        }
    }
}