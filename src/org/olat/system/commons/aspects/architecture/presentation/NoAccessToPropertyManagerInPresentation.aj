/**
* OLAT - Online Learning and Training<br>
* http://www.olat.org
* <p>
* Licensed under the Apache License, Version 2.0 (the "License"); <br>
* you may not use this file except in compliance with the License.<br>
* You may obtain a copy of the License at
* <p>
* http://www.apache.org/licenses/LICENSE-2.0
* <p>
* Unless required by applicable law or agreed to in writing,<br>
* software distributed under the License is distributed on an "AS IS" BASIS, <br>
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. <br>
* See the License for the specific language governing permissions and <br>
* limitations under the License.
* <p>
* Copyright (c) since 2004 at Multimedia- & E-Learning Services (MELS),<br>
* University of Zurich, Switzerland.
* <p>
*/
package org.olat.system.commons.aspects;

/**
 * advantage, does normally not compile and therefore does not need aspectj on the classpath
 * is just remains an .aj file. If you would like to have aspectj support within eclipse just install the aspectj plugin 
 * and add the aspectj nature to your project
 * @author Christian Guretzki
 *
 */
public aspect NoAccessToPropertyManagerInPresentation {
	
	pointcut scope():
		within(org.olat.presentation..*);
 
	pointcut useClassesFromAbove(): 
	    call(* org.olat.lms.properties.*.*(..)) && !call(* org.olat.lms.properties.PropertyManagerEBL.*(..));
	    // TODO: cg PropertyService is an old low-level manager and used as prototype for this rule
	    //          Do not allow to use core-services and supporting-services            
	    

	declare error
		: scope() && useClassesFromAbove()
		: "NoAccessToPropertyManagerInPresentation: You are not allowed to use org.olat.lms.properties in the presentation layer!";
		

}
