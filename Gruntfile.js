/**
 * Created by josh.hoffman on 6/3/2014.
 */
module.exports = function(grunt) {
    // load plugins
    [
        'grunt-contrib-coffee',
        'grunt-coffeelint',
        'grunt-contrib-watch'
    ].forEach(function(task) {
            grunt.loadNpmTasks(task);
        });

    grunt.initConfig({
        coffee: {
            compile: {
                files: {
                    'app.js': 'app.coffee'
                }
            }
        },
        coffeelint: {
            options: {
                configFile: 'coffeelint.json'
            },
            app: [
                '*.coffee'
            ]
        },
        watch: {
            coffee: {
                files: [
                    '*.coffee'
                ],
                tasks: [
                    'coffeelint',
                    'coffee'
                ]
            }
        }
    });

    //grunt.registerTask('default', ['cafemocha', 'jshint', 'less', 'notify:cafemocha'])
    grunt.registerTask('default', ['coffee', 'coffeelint'])
    //grunt.registerTask('default', ['coffeelint'])
};