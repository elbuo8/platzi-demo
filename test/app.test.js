const request = require('supertest');

const app = require('../app');

describe('app', function() {
  it('should serve html on index', (done) => {
    request(app).get('/').expect('Content-Type', /html/).expect(200, done);
  });
});
