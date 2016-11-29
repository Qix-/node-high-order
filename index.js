'use strict';

module.exports = function (c) {
	if ((c & 0xC0) !== 0xC0) {
		return (c & 0x80) ? 0 : 1;
	}

	if ((c & 0x60) === 0x40) {
		return 2;
	} else if ((c & 0x30) === 0x20) {
		return 3;
	} else if ((c & 0x18) === 0x10) {
		return 4;
	} else if ((c & 0x0C) === 0x08) {
		return 5;
	} else if ((c & 0x06) === 0x04) {
		return 6;
	} else if ((c & 0x03) === 0x02) {
		return 7;
	}

	return 8;
};
