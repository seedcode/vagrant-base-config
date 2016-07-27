module.exports = function(grunt) {
  'use strict';
	grunt.initConfig({
      shell: {
        sslDeploy: {
          command: "cd /opt &&" +
                    //Use --staging flag when testing to avoid the 20 cert rate limit per 7 days.
                    "./certbot-auto certonly --webroot --webroot-path /vagrant --agree-tos --renew-by-default --email <%= ssl.email %> -d <%= ssl.domain %> &&" +
                    "sudo service nginx stop &&" +
                    "sudo ln -s /etc/letsencrypt/live/<%= ssl.domain %> /etc/nginx/cert &&" +
                    "sudo sed -i 's#.*ssl_certificate\ .*#ssl_certificate /etc/nginx/cert/fullchain.pem;#' /etc/nginx/sites-enabled/default.conf &&" +
                    "sudo sed -i 's#.*ssl_certificate_key.*#ssl_certificate_key /etc/nginx/cert/privkey.pem;#' /etc/nginx/sites-enabled/default.conf &&" +
                    "sudo service nginx restart;",
          options: {
            stdout: true // Outputs grunt-shell commands to the terminal
          }
        },
      },
	});

	//Load our tasks
  grunt.loadNpmTasks('grunt-shell');

	// the default task can be run just by typing "grunt" on the command line
	grunt.registerTask('default', []);

  // task to create ssl certificates for web server
  grunt.registerTask('ssl', function(email, domain) {

    if (arguments.length === 0) {
      // Log an error
      grunt.log.error("SSL: No arguments provided. Please provide the email and domain for the SSL cert.");
      // Return false to short circuit the task.
      return false;
    }

    grunt.config.set('ssl.email', email);
    grunt.config.set('ssl.domain', domain);

    var tasks = [
      'shell:sslDeploy'
    ];

    // Run tasks
    grunt.task.run(tasks);

  });

};
