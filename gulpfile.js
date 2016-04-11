'use strict';

var gulp = require('gulp'),
	watch = require('gulp-watch'),
	jade = require('gulp-jade'),
	prefixer = require('gulp-autoprefixer'),
	uglify = require('gulp-uglify'),
	sourcemaps = require('gulp-sourcemaps'),
	rigger = require('gulp-rigger'),
	cssmin = require('gulp-minify-css'),
	rimraf = require('rimraf'),
	browserSync = require("browser-sync"),
	coffee = require('gulp-coffee'),
	reload = browserSync.reload;

var path = {
	build: {
		html: 'web/',
		js: 'web/js/',
		fonts: 'web/fonts/',
		jade: 'web/',
		coffee: 'web/js/'
	},
	src: {
		html: 'src/*.html',
		js: 'src/js/common.js',
		style: 'src/sass/*.sass',
		img: 'src/img/**/*.*',
		fonts: 'src/fonts/**/*.*',
		jade: 'src/jade/**/*.*',
		coffee: 'src/coffee/**/*.*'
	},
	watch: {
		html: 'src/**/*.html',
		js: 'src/js/**/*.js',
		fonts: 'src/fonts/**/*.*',
		jade: 'src/jade/**/*.*',
		coffee: 'src/coffee/**/*.*'
	},
	clean: './build'
};

var config = {
	server: {
		baseDir: "./build"
	},
	tunnel: true,
	host: 'localhost',
	port: 9000,
	logPrefix: "Frontend_Devil"
};


gulp.task('jade', function() {
	gulp.src(path.src.jade)
		.pipe(jade())
		.pipe(gulp.dest(path.build.jade))
});

gulp.task('coffee', function () {
	gulp.src(path.src.coffee)
		.pipe(coffee({bare: true}))
		.pipe(sourcemaps.write('./maps'))
		.pipe(gulp.dest(path.build.coffee))
});

gulp.task('webserver', function () {
	browserSync(config);
});

gulp.task('clean', function (cb) {
	rimraf(path.clean, cb);
});


gulp.task('js:build', function () {
	gulp.src(path.src.js)
		.pipe(rigger())
		.pipe(sourcemaps.init())
		.pipe(uglify())
		.pipe(sourcemaps.write())
		.pipe(gulp.dest(path.build.js))
		.pipe(reload({stream: true}));
});



gulp.task('fonts:build', function() {
	gulp.src(path.src.fonts)
		.pipe(gulp.dest(path.build.fonts))
		.pipe(reload({stream: true}));
});


gulp.task('jade:build', function() {
	gulp.src(path.src.jade)
		.pipe(jade({pretty: true}))
		.pipe(gulp.dest(path.build.jade))
		.pipe(reload({stream: true}));
});


gulp.task('coffee:build', function() {
	gulp.src(path.src.coffee)
		.pipe(coffee({bare: false})) // тру фолс позволяет делать самовызывающуюся функцию
		.pipe(gulp.dest(path.build.coffee))

});

gulp.task('build', [
	'js:build',
	'fonts:build',
	'jade:build',
	'coffee:build'
]);


gulp.task('watch', function(){

	watch([path.watch.jade], function(event, cb) {
		gulp.start('jade:build');
	});
	watch([path.watch.js], function(event, cb) {
		gulp.start('js:build');
	});

	watch([path.watch.fonts], function(event, cb) {
		gulp.start('fonts:build');

	});

	watch([path.watch.coffee], function(event, cb) {
		gulp.start('coffee:build');

	});

});


gulp.task('default', ['build', 'webserver', 'watch']);