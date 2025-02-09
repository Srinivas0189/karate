function fn() {
  karate.configure('ssl', true);  
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://conduit-api.bondaracademy.com/api/'
  }
  if (env == 'dev') {
    config.userName = 'srinivas@gmail.com'
    config.userPassword = 'test@123'
  } else if (env == 'qa') {
    config.userName = 'srinivas1@gmail.com'
    config.userPassword = 'test@1234'
  }
  var accessToken = karate.callSingle('classpath:helpers/createToken.feature',config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
}