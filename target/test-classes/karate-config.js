function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    Background: 'Background Value',
    username: 'Muhammad',
    password: 'Nissar' 
    
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'qa') {
    // customize
    config.username = 'Muhammad Qa'
    config.Background = 'Muhammad Qa'
    config.password = 'Muhammad Qa'
  }
  return config;
}