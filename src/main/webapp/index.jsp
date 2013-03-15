<% /*
This is an example that shows sessions in use within a JSP.

It's the simplest possible demo - a visit counter, but a
counter for the number of times that the current user has
visited during the current session.
*/

/* Get value, or set to zero if this is a new session */

String val = (String) session.getAttribute("previouses");
if ( val == null ) val = "0";

/* Convert to number, increment, save back into session */
int n = Integer.parseInt(val);
n++;
session.setAttribute("previouses",Integer.toString(n));

/* Also pick up the hosts so that we can echo this in the
reply page (great for testing load balancer and sticky
session algorithms on our training courses! */
String hostipr = request.getRemoteHost();
String hostipl = request.getServerName();

/* ------------------------------------------------- */

%>
<html>
<head>
<title>Sessions using a JSP</title>
</head>
<body>
<h1>Sessions in a JSP</h1>
This example program shows the use of a session within a
Java Server page (JSP). It's the simplest possible example,
counting the number of times that the user has visited in
the current session.<br /><br />
<b>Details from the session</b><br/>
Requested session:<%=request.getRequestedSessionId()%><br/>
Session: <%= session.getId()%><br/>
Generating or back end host: <%= hostipl %><br />
Accessing or front end host: <%= hostipr %><br />
<p>
<b>
Count: <%= n %><br/>
</b>
</body>
</html>
