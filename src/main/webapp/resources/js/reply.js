/**
 * 
 */
console.log("Reply Module......");
var replyService = (function() {
	//	return {name:"AAAA"};
	//===============add==========================
	function add(reply, callback, error) {
		console.log("reply...");
		$.ajax({
			type: 'post',
			url: '/replies/new',
			data: JSON.stringify(reply),
			contentType: "application/json;charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) { callback(result); }
			},
			error: function(xhr, status, er) {
				if (error) { error(er); }
			}
		})
	}
	//===============getList==========================
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json", function(data) {
			if (callback) { callback(data); }
		}).fail(function(xhr, status, err) {
			if (error) { error(); }
		});
	}	//getList
	//===============remove==========================
	function remove(rno, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/replies/' + rno,
			success: function(deleteResult, status, xhr) {
				if (callback) { callback(delete Result); }
			},
			error: function(xhr, status, er) {
				if (error) { error(er); }
			}
		});
	}	//remove
	//===============update==========================
	function update(reply, callback, error) {
		$.ajax({
			type: 'put',
			url: '/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) { callback(result); }
			},
			error: function(xhr, status, er) {
				if (error) { error(er); }
			}
		});
	}	//update
	//===============get==========================
	function get(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(result) {
			if (callback) { callback(result); }
		}).fail(function(xhr, status, err) {
			if (error) { error(); }
		});
	}
	return { add: add, getList: getList, remove: remove, update: update, get: get };
	//replyService라는 변수에 name이라는 속성, 'AAA'라는 값을 가진 객체 할당	
})();

//reply module
//console.log(replyService);