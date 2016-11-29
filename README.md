# node-high-order [![Travis-CI.org Build Status](https://img.shields.io/travis/Qix-/node-high-order.svg?style=flat-square)](https://travis-ci.org/Qix-/node-high-order) [![Coveralls.io Coverage Rating](https://img.shields.io/coveralls/Qix-/node-high-order.svg?style=flat-square)](https://coveralls.io/r/Qix-/node-high-order)

> Calculates the number of bytes in a UTF-8 glyph

Note: this function never returns `1`. In the event a byte is an ASCII byte (bit 7 is 0) or a UTF-8 continuation byte (bits `76x` are `10x`) then this function returns `0`.

## Usage:
```javascript
const highOrder = require('high-order');

console.log(highOrder(0xC0)); //-> 2
console.log(highOrder(0x01)); //-> 0

console.log(Buffer('🦄')[0])); //-> 4
```

## License
Licensed under the [MIT License](http://opensource.org/licenses/MIT).
You can find a copy of it in [LICENSE](LICENSE).
