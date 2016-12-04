/*'use strict';*/

var gulp = require('gulp'),
    autoprefixer = require('gulp-autoprefixer'),
    sass = require('gulp-sass'),
    cleanCSS    = require('gulp-clean-css'),
    rename       = require('gulp-rename'),
    browserSync  = require('browser-sync').create(),
    concat = require('gulp-concat'),
    csso = require('gulp-csso'),
    uglify       = require('gulp-uglify'),
    coffee = require('gulp-coffee'),
    gutil = require('gulp-util');
    
var bc = './bower_components/';

gulp.task('browser-sync', ['sass', 'html', 'coffee', 'js'], function() {
    browserSync.init({
        server: {
            baseDir: "./builds/dist/"
        },
        notify: false
    });
});

/*gulp.task('js', function() {
  gulp.src('builds/development/app/!**!/!*.js')
    .pipe(concat('app.coffee'))
    // .pipe(uglify()) //Minify 
    .pipe(gulp.dest('builds/dist/app/'))
});*/

gulp.task('html', function() {
  gulp.src('builds/development/**/*.html')
    .pipe(gulp.dest('builds/dist/'))
});

gulp.task('sass', function () {
  gulp.src('builds/development/sass/**/*')
return gulp.src('builds/development/sass/**/*')
      .pipe(sass({
      includePaths: require('node-bourbon').includePaths
  }).on('error', sass.logError))
      .pipe(rename({suffix: '.min', prefix : ''}))
      .pipe(autoprefixer({browsers: ['last 15 versions'], cascade: false}))
      .pipe(csso())
      .pipe(gulp.dest('builds/dist/css/'));
});

gulp.task('coffee', function() {
  gulp.src('builds/development/**/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(concat('app.js'))
    .pipe(gulp.dest('builds/dist/app/'));
});

gulp.task('js', function() {
    gulp.src('builds/development/**/*.js')
        .pipe(concat('app.js'))
        .pipe(gulp.dest('builds/dist/app/'));
});

gulp.task('img', function() {
  gulp.src('builds/development/img/**/*')
    .pipe(gulp.dest('builds/dist/img/'));
});

gulp.task('json', function() {
  gulp.src('builds/development/app/json/**/*.json')
    .pipe(gulp.dest('builds/dist/json/'));
});

gulp.task('fonts', function() {
  gulp.src('builds/development/fonts/**/*')
    .pipe(gulp.dest('builds/dist/fonts/'));
});

gulp.task('watch', function() {
  gulp.watch('builds/development/app/**/*.js', ['js']);
  gulp.watch('builds/development/app/json/**/*.json', ['json']);
  gulp.watch('builds/development/app/**/*.coffee', ['coffee']);
  gulp.watch('builds/development/sass/**/*.scss', ['sass']);
  gulp.watch('builds/development/**/*.html', ['html']);
  gulp.watch('builds/development/img/**/*', ['igulpmg']);
});


gulp.task('libs', function() {
    gulp.src([bc+'angular/angular.js',
            bc+'angular-ui-router/release/angular-ui-router.js',
            bc+'angular-resource/angular-resource.js',
            bc+'angular-animate/angular-animate.js',
            bc+'angular-toastr/dist/angular-toastr.js',
            bc+'angular-toastr/dist/angular-toastr.tpls.js',
            bc+'angular-jk-rating-stars/dist/jk-rating-stars.js'
          ])
      .pipe(concat('angular.concat.js'))
     // .pipe(uglify()) //Minify 
      .pipe(gulp.dest('./builds/dist/libs/angular/'));
});


gulp.task('default', [
  'libs',
  'html',
  'img',
  'js',
  'coffee',
  'sass',
  'watch',
  'json',
  'fonts',
  'browser-sync'
]);
